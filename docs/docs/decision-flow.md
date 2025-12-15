# Decision Flow Diagram

This document describes the high-level decision flow of the AI Decision Support System.

It serves as a blueprint for visual diagrams and explains how the system processes user input from initial signals to final recommendation.

---

## Purpose of the Diagram

The decision flow diagram is designed to:
- provide fast orientation for reviewers,
- explain system behavior without code,
- visualize elimination-based decision logic,
- support transparency and auditability.

The diagram reflects **system logic**, not UI or implementation details.

---

## High-Level Flow Overview

The system follows a linear but conditional flow:

1. User Input
2. Signal Aggregation
3. Sequential Path Elimination
4. Decision Outcome

Each step narrows the solution space without ranking or scoring.

---

## Step 1: User Input

The process starts with structured user input collected through four diagnostic modules:

- Context & Starting Point
- Cognitive & Work Style
- Frustration & Abstraction Tolerance
- Expectations & Available Resources

Each module produces qualitative signals rather than numerical values.

---

## Step 2: Signal Aggregation

Signals are aggregated into three categories for each AI path:

- Hard Stop
- Risk Flag
- Support Signal

At this stage:
- no path is selected,
- no recommendation is made,
- only alignment or misalignment is detected.

---

## Step 3: Sequential Path Elimination

AI paths are evaluated sequentially across modules.

For each path:
- Hard Stop → path is eliminated immediately
- Risk Flag → path remains but marked as high-risk
- Support Signal → path remains viable

Elimination always takes precedence over support.

---

## Step 4: Decision Resolution

After all modules are processed, the system evaluates remaining paths:

### Case A: One Path Remains
- Path becomes the main recommendation

### Case B: Two Paths Remain
- One becomes the main recommendation
- One is presented as an alternative

### Case C: No Paths Remain
- System returns “No clear recommendation”
- Iteration is suggested

This outcome is treated as valid and ethical.

---

## Iteration Loop (Optional)

If iteration is required:
- expectations may be adjusted,
- assumptions revisited,
- tolerance reassessed.

The system can be re-run with updated inputs.

---

## Diagram Representation (Suggested)

A visual diagram should include:

- Start node: User Input
- Four module nodes (in sequence)
- Elimination checkpoints per module
- Final decision node with three possible outcomes

The diagram should avoid:
- scoring visuals,
- comparison charts,
- ranking indicators.

---

## Design Philosophy

The decision flow emphasizes:
- elimination over optimization,
- transparency over prediction,
- safety over ambition.

The system’s value lies in preventing poor early decisions, not predicting success.
