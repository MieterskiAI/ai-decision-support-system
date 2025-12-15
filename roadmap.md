# Project Roadmap

This document outlines potential future extensions of the AI Decision Support System.
The roadmap is intentionally conservative and focused on preserving decision quality.

---

## v1.0 – Completed

- Decision logic fully defined
- Diagnostic modules documented
- Example case study and report created
- Ethical and scope constraints established

This version focuses on conceptual clarity and system design, not implementation.

---

## v1.1 – Interactive Input (Lightweight)

**Goal:**  
Allow users to provide structured input without introducing full application complexity.

**Possible approaches:**
- Static form (e.g., Google Forms or Typeform)
- Structured JSON or YAML input
- Spreadsheet-based input (rows = users)

**Key constraints:**
- No real-time chat interface
- No adaptive questioning yet
- No user profiling or storage

---

## v1.2 – Automated Report Generation

**Goal:**  
Automatically generate the decision report based on provided inputs.

**Possible approaches:**
- Template-based report generation
- Rule-based logic engine
- LLM-assisted explanation layer (non-authoritative)

**Key constraints:**
- Deterministic decision logic
- Explanatory text must remain interpretable
- No black-box scoring

---

## v1.3 – Visual Decision Flow

**Goal:**  
Provide a visual representation of the decision process.

**Possible approaches:**
- Static flow diagram
- Read-only decision tree visualization
- Interactive explanation (not decision override)

**Key constraints:**
- Visualization must reflect logic, not simplify it
- No gamification or ranking

---

## Explicit Non-Goals

The following are intentionally excluded:

- Machine learning model training
- Predictive career analytics
- User comparison or benchmarking
- Employment outcome optimization

---

## Long-Term Direction (Optional)

If extended further, the system could serve as:
- a pre-diagnostic tool before education programs,
- a decision clarification step in career transitions,
- a teaching example of ethical AI decision support design.

Any future development should preserve:
- transparency,
- user agency,
- and decision integrity.
