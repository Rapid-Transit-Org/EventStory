# Failing Tests in EventStory

EventStory follows a test-first development approach. In some cases, we commit _intentionally failing tests_ as part of the design and modelling process.

This document explains when and why that happens — and how we keep it safe and intentional.

---

## Why We Commit Failing Tests

Sometimes the fastest way to express a new behaviour is to write a test that describes it — before writing the implementation.

This helps us:

- Drive development through small, observable changes
- Treat tests as part of the modelling process
- Maintain narrative continuity between idea and implementation

---

## When It's Allowed

You may commit a failing test **only** if:

- It represents a **clearly intended behaviour** that hasn’t been implemented yet
- It’s tagged using the commit message prefix `test(wip):`
- You respond to the prompt in the pre-commit hook confirming that it’s deliberate
- You expect to return to it soon — it's not a long-term placeholder
- The test failure is clear, contained, and doesn't break unrelated logic

---

## Guardrails We Use

- A **pre-commit script** blocks failing test commits unless explicitly confirmed
- Failing test commits must include the `--no-verify` flag manually
- These tests are marked with the `test(wip):` prefix in the commit message
- Our test suite is expected to pass unless work-in-progress tests are being intentionally run

---

## When It's Not Allowed

Do **not** commit a failing test if:

- It's an unexpected failure (e.g. a bug)
- It’s likely to confuse another developer or misrepresent system behaviour
- It’s left unresolved over multiple cycles
- It appears in the same commit as unrelated implementation code
- The cause of failure is ambiguous or unclear

---

## Summary

This is not a shortcut — it’s a strategy.

Failing tests in EventStory serve as _executable intention_ during development. They let us move incrementally while keeping behaviours visible, discussed, and testable.

Used carefully, this supports a healthy, observable development cycle — even in exploratory or domain-heavy environments.

---

🧠 _Failing tests are welcome here — when they make the next step clearer for everyone._
