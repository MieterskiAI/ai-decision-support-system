# AI Decision Support System

## 1. Problem
People starting in AI often choose a path too early, based on hype or incomplete self-assessment. That leads to mismatched learning plans, frustration, and wasted effort.

## 2. Solution (high level)
This repository documents a **human-in-the-loop decision-support workflow** that helps narrow AI entry paths using structured qualitative signals and elimination heuristics.

> **Status / Disclaimer:** This is a documentation-led portfolio case study, **not a runnable automated system or pipeline**. The Power Platform content below is a **conceptual mapping**, not a claim of a built production solution.

## 3. Workflow (step-by-step)
1. Collect structured inputs across four diagnostic modules.
2. Convert notes into qualitative signals (not scores).
3. Apply elimination logic path-by-path.
4. Flag ambiguity or conflict when signals are weak.
5. Produce a recommendation + alternatives + conditions.
6. Keep final judgment with a human reviewer.

Detailed workflow:
- [`docs/workflow.md`](docs/workflow.md)
- Decision logic: [`docs/decision-logic.md`](docs/decision-logic.md)
- Decision flow diagram: [`docs/architecture.mmd`](docs/architecture.mmd)

## 4. Inputs / Outputs
**Inputs**
- Profile context and constraints.
- Work-style preferences.
- Frustration/ambiguity tolerance.
- Expectations and available resources.

**Outputs**
- Decision report with:
  - recommended path,
  - eliminated paths and rationale,
  - alternatives/conditional options,
  - explicit human review reminder.

Examples:
- [`examples/synthetic_input.json`](examples/synthetic_input.json)
- [`examples/quick_walkthrough.md`](examples/quick_walkthrough.md)
- [`examples/synthetic_output.md`](examples/synthetic_output.md)
- [`docs/example-report.md`](docs/example-report.md)

## 5. Edge cases
The workflow handles low-confidence scenarios explicitly, including insufficient, conflicting, or ambiguous signals, plus iteration/re-entry.

Details:
- [`docs/edge-cases.md`](docs/edge-cases.md)

## 6. KPIs (planned)
No measured KPI outcomes are claimed in this repo. KPI definitions are provided as **PLANNED** metrics for future implementation.

Details:
- [`docs/metrics.md`](docs/metrics.md)

## 7. Quick demo (how to read/use the example artifacts in this repo)
1. Open synthetic input: [`examples/synthetic_input.json`](examples/synthetic_input.json).
2. Read walkthrough: [`examples/quick_walkthrough.md`](examples/quick_walkthrough.md).
3. Compare with synthetic output report: [`examples/synthetic_output.md`](examples/synthetic_output.md).
4. Cross-check logic in [`docs/decision-logic.md`](docs/decision-logic.md).

All `synthetic_*` artifacts are explicitly synthetic examples for portfolio demonstration.

## 8. Power Platform mapping (conceptual implementation)
If translated to Microsoft Power Platform (conceptually):
- **Power Apps**: guided intake form for the four diagnostic modules.
- **Power Automate**: orchestrates stages (signal normalization, elimination checks, draft report assembly).
- **Dataverse / SharePoint lists**: stores intake records, rule snapshots, and review outcomes.
- **Human approval step**: reviewer confirms/edits recommendation before sharing.
- **Document output**: report template populated and exported for user reflection.

This mapping describes implementation intent only; it does not claim this repo contains a built Power Platform app/flow.

## 9. What this proves (skills demonstrated)
- Business-process thinking: clear stages, entry/exit conditions, and traceable decisions.
- Automation design readiness: workflow decomposed into steps suitable for Power Automate.
- Human-in-the-loop control: explicit review checkpoints instead of blind automation.
- Documentation quality: decision logic, architecture, examples, and edge-case handling are auditable.
- Portfolio maturity: scope boundaries and non-goals are clearly stated.

Related context:
- [`docs/case-study-pan-m.md`](docs/case-study-pan-m.md)
- [`docs/portfolio-audit.md`](docs/portfolio-audit.md)
- [`roadmap.md`](roadmap.md)
