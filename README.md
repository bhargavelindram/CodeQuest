# CodeQuest

**A free, open-source coding education RPG.** Learn deliberately, earn XP for real practice, explore a visible skill tree, set goals, and build portfolio projects.

## Technology paths

Python, HTML, CSS, JavaScript, Java, C++, TypeScript, PHP, Kotlin, C, C#, Rust, Swift, React, SQL, R, Go (Golang), **standard Lua**, and **Roblox Lua (Luau)**.

Lua and Roblox Luau are separate learning paths. Roblox content focuses on Studio, events, client/server boundaries, replication and server-authoritative game logic. Standard Lua focuses on the general-purpose embeddable language. The C track teaches standard C.

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
- No ads, paid tier, energy meter or lesson cap. Optional cloud features require separate account configuration.

## Cloud features

Optional Google sign-in, private progress sync, public community XP leaderboard, AI mentor Edge Function, and server-verified lesson/certificate endpoints are configurable Supabase integrations. They are not live until a Supabase project is configured and the SQL schema/functions are deployed; see [SETUP.md](SETUP.md). The leaderboard is a community progress board, not a secure competitive ranking. Public compiler endpoints are third-party services and may have availability or usage limits.

## Free access policy

CodeQuest has no energy system, daily lesson cap, premium course lock, paid subscription, ads, or paid XP boosts. Daily targets are optional and never restrict lessons. The built-in Code Coach works offline; a natural-language AI mentor is optional and requires backend configuration. Local certificates are not externally verified. Cross-device sync and signed certificates require the setup in SETUP.md.

## Honest scope

This is a working learning-platform foundation, not yet a complete professional-level curriculum. Every track currently has five introductory lessons; the 11-stage professional roadmap is published as a curriculum plan, not eleven completed interactive modules. Python and JavaScript execute in the browser; C/C++/C# use the public compiler, other common runtimes use the public compiler where available, HTML/CSS have sandboxed previews, and React has a sandboxed preview. Roblox game APIs still require Roblox Studio. External compilers/CDNs may be unavailable, and the public runner is not a substitute for a hardened, dedicated execution sandbox. The AI mentor, cross-device sync, public leaderboard and signed certificates require the optional Supabase setup. The course must still grow with reviewed advanced lessons, more comprehensive language-specific tests, spaced retrieval, capstone rubrics and accessibility/security reviews before it can be described as professional-level training. A course alone cannot guarantee employment.

## Privacy

By default, progress is saved in `localStorage` in the current browser. If you configure Supabase and sign in, your progress record and public profile are also synced to your account. Clicking the AI mentor sends the current code and lesson context to the configured model provider; do not enter secrets, passwords or personal data into the editor. Browser data can be cleared, so use JSON export for backups. CodeQuest does not include analytics or ad tracking.

## License

MIT. See [LICENSE](LICENSE).