# CodeQuest cloud setup (optional, free-tier friendly)

The site still runs without cloud services. Local progress, lessons, and browser-based Python/JavaScript practice remain available if you skip this. Cloud features activate only after you configure your own project.

## 1. Create the Supabase project

1. Create a project in the [Supabase dashboard](https://supabase.com/dashboard).
2. Open **SQL Editor** and run the entire `supabase/schema.sql` file from this repository.
3. Open **Project Settings → API**. Copy the Project URL and the public anon/publishable key.
4. Edit `auth-config.js` in this repository and fill in `supabaseUrl` and `supabaseAnonKey`. These two values are intended for browser use. **Never put the service-role key in `auth-config.js` or any other public file.**
5. Under **Authentication → URL Configuration**, add `https://bhargavelindram.github.io/CodeQuest/` to the allowed redirect URLs. Add your local development URL too if needed.

## 2. Enable Google sign-in

1. In Google Cloud Console, create or select a project and configure the OAuth consent screen.
2. Create an OAuth client for a web application.
3. Copy the callback URL shown by Supabase under **Authentication → Providers → Google** into the Google OAuth client's authorized redirect URIs.
4. Paste the Google client ID and secret into the Supabase Google provider settings and enable the provider.
5. Save, then open the CodeQuest site and choose **Sign in with Google**.

## 3. Deploy the AI tutor and signed-certificate endpoints

Install the Supabase CLI, sign in, and link this repository to your project:

```sh
supabase login
supabase link --project-ref YOUR_PROJECT_REF
```

Create a random signing secret (keep it private) and set the Gemini API key as a server-side secret. Gemini API free-tier availability and quotas depend on Google's current terms and region.

```sh
supabase secrets set GEMINI_API_KEY=YOUR_GEMINI_API_KEY
supabase secrets set CERTIFICATE_SECRET=PASTE_A_LONG_RANDOM_SECRET_HERE
supabase functions deploy ai-mentor
supabase functions deploy verify-lesson
supabase functions deploy issue-certificate
supabase functions deploy verify-certificate
```

Supabase supplies its project URL and service-role credentials to deployed Edge Functions. Do not copy the service-role key into the frontend. CodeQuest does not impose a daily AI request cap; the external AI provider may still enforce its own free-tier quota, rate limits, and terms.

## 4. What the features mean

- **Google sign-in and cloud sync:** saves a learner's progress record to their Supabase account, so they can continue on another device.
- **Community leaderboard:** displays public profile name and progress totals. It is a friendly XP board, not a tamper-proof competitive ranking; clients can change locally earned XP.
- **AI mentor:** sends the code and lesson context only when the learner clicks “Explain my code.” Do not paste passwords, tokens, personal data, or secrets into the editor. The external model provider may process the submitted code under its terms.
- **Verified lesson passes:** the Edge Function runs supported code against the expected output using a third-party public compiler, then records a pass on the server. HTML, CSS, React and Roblox Studio lessons are not yet eligible for signed certificates.
- **Certificates:** a signed certificate can be issued only when all five lessons for a supported language have server-verified passes. The public verification endpoint checks the signature. A printable certificate created without the backend is only a local learning record.
- **Code execution:** browser Python and JavaScript are independent of the cloud login. Additional runtimes use a public compiler service; that service can be temporarily unavailable or impose its own limits.

## 5. Free usage

CodeQuest itself has no paid tier, ads, energy meter, paid XP, or daily lesson lock. Supabase, Google AI and public compiler services are third-party services with their own current quotas, eligibility, and terms. Do not promise unlimited external API capacity. You can use the local learning experience without enabling any of them.

## Troubleshooting

- **Google login redirects back without signing in:** check the Supabase redirect allowlist and Google OAuth callback URL.
- **Cloud progress does not sync:** check the project URL/key, run the SQL schema, and inspect browser console errors.
- **AI mentor returns an error:** check the `GEMINI_API_KEY` secret and the provider's current quota.
- **No verified certificate:** each of the five lessons must have a server-verified pass for the same signed-in user and exact language label.
- **Compiler errors:** check whether the public compiler currently lists the language. The public runner is not operated by CodeQuest.
