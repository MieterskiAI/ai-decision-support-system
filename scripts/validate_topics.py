#!/usr/bin/env python3
import re
import sys
from pathlib import Path

METADATA_PATH = Path("docs/repo-metadata.md")
TOPIC_RE = re.compile(r"^[a-z0-9-]{1,50}$")


def extract_topics(text: str):
    topics = []
    in_topics = False
    for line in text.splitlines():
        stripped = line.rstrip("\n")
        if stripped.strip() == "topics:":
            in_topics = True
            continue

        if in_topics:
            if stripped.startswith("  - "):
                topics.append(stripped[4:].strip())
            elif stripped.strip() == "" or stripped.strip().startswith("```"):
                continue
            else:
                break

    return topics


def main() -> int:
    if not METADATA_PATH.exists():
        print(f"ERROR: File not found: {METADATA_PATH}", file=sys.stderr)
        return 1

    content = METADATA_PATH.read_text(encoding="utf-8")
    topics = extract_topics(content)

    if not topics:
        print("ERROR: No topics found under 'topics:' in docs/repo-metadata.md", file=sys.stderr)
        return 1

    errors = []

    if len(topics) > 20:
        errors.append(f"Too many topics: {len(topics)} (maximum is 20)")

    for idx, topic in enumerate(topics, start=1):
        if not TOPIC_RE.match(topic):
            errors.append(
                f"Invalid topic #{idx} '{topic}'. Must match regex ^[a-z0-9-]{{1,50}}$"
            )

    if errors:
        print("Topic validation failed:", file=sys.stderr)
        for err in errors:
            print(f"- {err}", file=sys.stderr)
        return 1

    print(f"Topic validation passed: {len(topics)} topic(s) are valid.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
