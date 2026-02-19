# Edge Cases and Handling

This document lists common edge cases and how the workflow responds.

## Statuses & traceability
- **status: needs-more-input** — used when intake is incomplete or ambiguous.
- **status: iteration-required** — used when conflicting signals prevent a confident recommendation.
- **status: draft-ready** — used when a recommendation can be drafted for human review.
- **status: review-required** — used when a human reviewer must approve, adjust, or defer the output.
- **status: blocked-technical** — used when a technical failure (timeouts/throttling/connector issues) blocks progress.
- **traceability minimum:** every case should keep input snapshot, key signal notes, elimination rationale, and reviewer action.

## 1) Insufficient signals
**Workflow stage:** Intake collection / Signal normalization.

**Example:** intake answers are too short or incomplete.

**Handling:**
- Do not finalize a recommendation.
- Trigger follow-up questions.
- Mark status as `needs-more-input` and then `iteration-required` if unresolved.

## 2) Conflicting signals
**Workflow stage:** Elimination pass / Conflict-ambiguity handling.

**Example:** user prefers strict structure but also targets highly exploratory path types.

**Handling:**
- Keep both signals visible in report notes.
- Eliminate only when hard-stop rules apply.
- Otherwise provide primary + alternative with explicit trade-offs.
- Mark status as `iteration-required` until reviewer confirms direction.

## 3) Ambiguous inputs
**Workflow stage:** Signal normalization.

**Example:** unclear statements such as "I can learn fast" without time/resource detail.

**Handling:**
- Convert to a provisional signal with low confidence.
- Add clarification request before final recommendation.
- Keep status as `needs-more-input`.

## 4) Re-entry / iteration
**Workflow stage:** Conflict-ambiguity handling / Human review.

**Example:** user returns after increasing weekly study time.

**Handling:**
- Re-run elimination using updated inputs.
- Re-open previously conditional paths if blockers changed.
- Preserve traceability of what changed and why.
- Move to `draft-ready` only after updates are documented.

## 5) Overly optimistic expectations
**Workflow stage:** Elimination pass / Report drafting.

**Example:** expectation of immediate role transition with low available hours.

**Handling:**
- Add feasibility warning to the report.
- Keep recommendation realistic and staged.
- Require human review before sharing final guidance.
- Mark status as `review-required`.

## 6) Multiple viable paths
**Workflow stage:** Report drafting.

**Example:** both automation and consulting remain viable.

**Handling:**
- Provide one primary path and one alternative.
- Include a short "decision test" (what to try first) for the user.
- Keep rationale notes so tie-break logic is auditable.

## 7) Duplicate or near-duplicate submissions
**Workflow stage:** Intake collection.

**Example:** the same user submits the same intake twice, or re-submits with only minor wording changes.

**Handling:**
- Detect duplicate intent by comparing user identifier + submission window + high-level signal similarity.
- Link duplicate entries to one canonical case record.
- Preserve both submissions in traceability notes, but process one active record.
- Mark duplicate records as `review-required` if merge confidence is low.

## 8) Throttling / timeouts in conceptual automation steps
**Workflow stage:** Signal normalization / Report drafting.

**Example:** a conceptual Power Automate step times out while preparing a draft recommendation.

**Handling:**
- Do not assume partial output is complete.
- Record failure point and keep current case status as `blocked-technical`.
- Re-run only the failed stage when possible; avoid redoing already validated steps.
- Escalate to human review when repeated timeout occurs.

## 9) Auth / permissions limitations
**Workflow stage:** Human review / Final recommendation release.

**Example:** reviewer lacks access to underlying intake notes or cannot approve report output.

**Handling:**
- Block final release until access is corrected.
- Record permission failure and affected stage in traceability notes.
- Route to authorized reviewer or owner for action.
- Keep status as `review-required` until approval is completed by permitted role.
