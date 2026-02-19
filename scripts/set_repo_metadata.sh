#!/usr/bin/env bash
set -euo pipefail

METADATA_FILE="docs/repo-metadata.md"

err() {
  echo "Error: $*" >&2
  exit 1
}

run_cmd() {
  if [[ "${DRY_RUN:-0}" == "1" ]]; then
    echo "DRY_RUN: $*"
  else
    "$@"
  fi
}

[[ -f "$METADATA_FILE" ]] || err "$METADATA_FILE not found."

ABOUT_LINE="$(awk '/^## About \(GitHub 1-liner\)/ {getline; print; exit}' "$METADATA_FILE")"
[[ -n "$ABOUT_LINE" ]] || err "Could not parse About line from $METADATA_FILE"

TOPICS=()
while IFS= read -r line; do
  topic="${line#  - }"
  TOPICS+=("$topic")
done < <(awk '
  /^topics:/ {in_topics=1; next}
  in_topics && /^  - / {print; next}
  in_topics && !/^  - / {in_topics=0}
' "$METADATA_FILE")

[[ ${#TOPICS[@]} -gt 0 ]] || err "Could not parse topics list from $METADATA_FILE"

if [[ "${DRY_RUN:-0}" == "1" ]]; then
  if command -v gh >/dev/null 2>&1; then
    REPO_SLUG="$(gh repo view --json nameWithOwner -q .nameWithOwner 2>/dev/null || true)"
  else
    REPO_SLUG=""
  fi

  if [[ -z "${REPO_SLUG:-}" ]]; then
    REPO_SLUG="$(git config --get remote.origin.url | sed -E 's#(git@github.com:|https://github.com/)##; s#\.git$##' || true)"
  fi

  [[ -n "${REPO_SLUG:-}" ]] || REPO_SLUG="<owner/repo>"

  run_cmd gh repo edit "$REPO_SLUG" --description "$ABOUT_LINE"
  for topic in "${TOPICS[@]}"; do
    [[ -n "$topic" ]] || continue
    run_cmd gh repo edit "$REPO_SLUG" --add-topic "$topic"
  done
  echo "Repository metadata dry-run prepared for $REPO_SLUG"
  exit 0
fi

command -v gh >/dev/null 2>&1 || err "GitHub CLI (gh) is not installed."
if ! gh auth status >/dev/null 2>&1; then
  err "GitHub CLI is not authenticated. Run: gh auth login"
fi

REPO_SLUG="$(gh repo view --json nameWithOwner -q .nameWithOwner 2>/dev/null || true)"
[[ -n "$REPO_SLUG" ]] || err "Could not detect GitHub repository from current directory."

run_cmd gh repo edit "$REPO_SLUG" --description "$ABOUT_LINE"
for topic in "${TOPICS[@]}"; do
  [[ -n "$topic" ]] || continue
  run_cmd gh repo edit "$REPO_SLUG" --add-topic "$topic"
done

echo "Repository metadata update completed for $REPO_SLUG"
