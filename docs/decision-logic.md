# Decision Logic

This document describes the core decision-making logic of the AI Decision Support System.

The system is designed as a **Decision Support System (DSS)**, not an automated decision-maker.
Its primary goal is to reduce early-stage career friction by eliminating misaligned AI paths and recommending a realistic starting direction.

---

## Design Principles

The decision logic follows several key principles:

- No scoring or ranking of users
- No comparison between users
- No “best path” assumption
- Preference for elimination over optimization
- Explicit acknowledgment of uncertainty

The system favors **clarity and safety** over aggressive recommendations.

---

## Decision Model Overview

The decision process consists of three sequential phases:

1. **Signal Collection**
2. **Path Elimination**
3. **Recommendation or Iteration**

Each phase is deterministic in structure but heuristic in interpretation.

---

## Phase 1: Signal Collection

User input is collected through four diagnostic modules:

### Module 1 – Context & Starting Point
Purpose: establish realism and baseline feasibility.

Collected signals include:
- technical exposure,
- familiarity with AI tools,
- motivation for entering AI.

This module rarely eliminates paths on its own.
Instead, it sets constraints and risk flags.

---

### Module 2 – Cognitive & Work Style
Purpose: identify dominant working and thinking patterns.

Collected signals include:
- preference for structure vs. exploration,
- comfort with ambiguity,
- satisfaction from building, organizing, or advising.

This module has **strong elimination power**.

---

### Module 3 – Frustration & Abstraction Tolerance
Purpose: protect users from paths likely to cause burnout or early abandonment.

Collected signals include:
- reaction to unclear problems,
- tolerance for debugging and trial-and-error,
- need for explicit rules.

This module can produce **hard elimination signals**.

---

### Module 4 – Expectations & Resources
Purpose: assess feasibility within real-world constraints.

Collected signals include:
- available weekly time,
- expected timeline for results,
- personal definition of early success.

This module acts as a final feasibility filter.

---

## Phase 2: Path Elimination Logic

At the start of Phase 2, all AI paths are considered active.

Elimination proceeds sequentially across modules.

### Elimination Categories

For each path, signals are interpreted as:

- **Hard Stop**  
  The path is eliminated due to high mismatch or risk.

- **Risk Flag**  
  The path remains possible but is marked as high-risk.

- **Support Signal**  
  The path aligns with user tendencies and constraints.

No numerical weighting is applied.

---

## AI Path Elimination Criteria (v0.1)

### AI Automation / AI Operations

**Hard Stops:**
- strong aversion to structured workflows,
- dislike of process-oriented work,
- intolerance for configuration and integration tasks.

**Risk Flags:**
- very limited weekly time (<5 hours),
- low patience for testing and refinement.

**Support Signals:**
- satisfaction from organizing systems,
- preference for measurable, practical outcomes,
- comfort with tools and operational logic.

---

### Prompt Engineering / AI Interaction Design

**Hard Stops:**
- need for strict rules and deterministic behavior,
- frustration with ambiguous or subjective outcomes,
- expectation of immediate, repeatable results.

**Risk Flags:**
- low tolerance for iteration,
- discomfort with language-driven experimentation.

**Support Signals:**
- interest in language, intent, and nuance,
- enjoyment of refining interactions,
- curiosity about model behavior.

---

### AI Engineering (Light)

**Hard Stops:**
- strong aversion to technical concepts,
- inability to tolerate debugging uncertainty,
- preference for purely conceptual work.

**Risk Flags:**
- minimal time availability,
- low resilience to early technical failure.

**Support Signals:**
- curiosity about system internals,
- acceptance of learning through failure,
- interest in integrations, APIs, and logic flow.

---

### AI Consulting / Implementation

**Hard Stops:**
- discomfort with stakeholder communication,
- avoidance of responsibility for recommendations,
- preference for isolated individual work.

**Risk Flags:**
- lack of domain or operational experience,
- low confidence in decision communication.

**Support Signals:**
- enjoyment of explaining complex ideas simply,
- comfort in advisory roles,
- interest in applyi
