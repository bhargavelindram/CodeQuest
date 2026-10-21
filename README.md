# CodeQuest

**A free, open-source coding education RPG.** Learn deliberately, earn XP for real practice, explore a visible skill tree, set goals, and build portfolio projects.

## Technology paths

Python, HTML, CSS, JavaScript, Java, C++, TypeScript, PHP, Kotlin, C+, C#, Rust, Swift, React, SQL, R, Go (Golang), **standard Lua**, and **Roblox Lua (Luau)**.

Lua and Roblox Luau are separate learning paths. Roblox content focuses on Studio, events, client/server boundaries, replication and server-authoritative game logic. Standard Lua focuses on the general-purpose embeddable language. C+ is retained as a requested label, but it is not a widely standardized language designation like C or C++; clarify the intended compiler/language before treating it as a real course.

## Run locally

Open `index.html` in a modern browser, or run:

```bash
python3 -m http.server 8000
```

Then visit http://localhost:8000.

## Deploy with GitHub Pages

1. In repository **Settings → Pages**, choose **Deploy from a branch**.
2. Select `main` and `/(root)`, then save.
3. Wait for deployment. The site should be available at https://bhargavelindram.github.io/CodeQuest/.

## Included in this foundation

- Responsive dark dashboard, 19 track directory, visible prerequisite skill trees and locked future modules.
- Learning module templates, reflection-based mastery, XP and levels.
- Diagnostic quiz with answer explanations, goals, projects, achievements and self-reported study streak.
- Browser-local progress with JSON export/import.
- MIT licence and contribution guide.
- No sign-in, paid backend, ads, telemetry, subscription, premium tier or usage cap.

## Cloud features

Optional Google sign-in, private progress sync, public community XP leaderboard, AI mentor Edge Function, and server-verified lesson/certificate endpoints are configurable Supabase integrations. They are not live until a Supabase project is configured and the SQL schema/functions are deployed; see [SETUP.md](SETUP.md). The leaderboard is a community progress board, not a secure competitive ranking. Public compiler endpoints are third-party services and may have availability or usage limits.

## Free access policy

CodeQuest has no energy system, daily lesson cap, premium course lock, paid subscription, ads, or paid XP boosts. Daily targets are optional and never restrict lessons. The built-in Code Coach is a free, offline rule-based helper, not a hosted generative AI model. Certificates are printable local records, not externally verified credentials. Cross-device sync and a real AI mentor need additional backend/provider setup.

## Honest scope

This is a functional front-end foundation, not yet a complete professional-level curriculum. Module content is a structured starting template and the quiz currently tests cross-language foundations. Python and JavaScript have browser-based execution, C/C++/C# use a public compiler endpoint when available, and HTML/CSS have sandboxed previews. Availability depends on third-party CDNs/compiler services; several language tracks still lack a configured runner or robust automatic grading. The Code Coach is not a generative AI tutor. Cross-device sync requires the optional Supabase setup. AI tutoring requires a Gemini API key stored only as an Edge Function secret. Before advertising this as hiring preparation, expand every path with reviewed, versioned lessons; language-specific exercises and tests; spaced retrieval; capstone rubrics; accessibility and security reviews; and real toolchain workflows. A course alone cannot guarantee employment.

## Privacy

Progress is saved in `localStorage` in the current browser and does not sync between devices. Browser data can be cleared, so use JSON export for backups. There is no analytics or tracking code.

## License

MIT. See [LICENSE](LICENSE).