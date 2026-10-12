# CodeQuest curriculum architecture

CodeQuest currently includes 19 learning tracks, each with an 11-stage roadmap and a long-form lesson template: runtime and setup; values and types; control flow; functions; collections and data modelling; debugging and tests; files and APIs; algorithms; architecture; security and reliability; and a capstone.

Each track has its own professional context, toolchain guidance, worked syntax example, common failure modes and capstone direction. Standard Lua and Roblox Lua (Luau) are intentionally separate:
- **Lua** covers the standard language/runtime, tables, lexical scope, metatables and embedding. Roblox engine APIs are not assumed.
- **Roblox Lua (Luau)** covers Luau and Roblox Studio, with server-authoritative game logic, RemoteEvent validation, client/server boundaries, replication and multiplayer testing.

Other deliberate distinctions:
- **React** is taught as a JavaScript UI library, not as a separate programming language.
- **C+** remains a clarification/toolchain-literacy path because the label is not standardized enough to safely invent a C+ language curriculum.
- **TypeScript** explicitly distinguishes compile-time types from runtime input validation.
- **SQL** emphasizes relational modelling, query safety and transactions; **R** emphasizes reproducible statistical analysis.

## Lesson quality bar

Each stage should continue to grow into a reviewed module with:
- Exact supported language/runtime versions and a reproducible setup.
- Measurable learning outcomes, explanations and multiple worked examples.
- Guided labs, independent exercises, hints and feedback for common wrong answers.
- Automated unit, integration and boundary tests wherever execution is supported.
- Retrieval practice, spaced review and a clear mastery rubric.
- Accessibility, security, performance and maintainability considerations appropriate to the track.
- Estimated time only as guidance, never a forced timer.

## Current limitations

The current site is a static, browser-only learning application. Reflection checks and quiz scores are not proof of code correctness. It does not yet run arbitrary learner code in a sandbox, automatically grade open-ended programs, or provide a fully reviewed 209-module textbook. Do not describe a course as hiring-certified or production-certified. Those capabilities require independently reviewed curriculum, robust test suites, a secure execution sandbox and accessibility/security audits.

## Curriculum contribution workflow

1. State the intended audience, prerequisites and runtime version.
2. Write an original explanation and at least two worked examples.
3. Include a guided lab plus an independent task with explicit acceptance criteria.
4. Add normal, boundary, malformed-input and regression tests.
5. Explain common mistakes and why plausible wrong answers fail.
6. Review technical accuracy, accessibility, safety and version drift.
7. Update this document when a module is genuinely complete; do not equate a roadmap placeholder with finished course content.
