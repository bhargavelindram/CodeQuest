Google sign-in and cloud saves

CodeQuest is a static GitHub Pages app. Google sign-in needs a cloud identity provider and database. This integration uses Supabase Auth with Google OAuth and a per-user progress row protected by Row Level Security.

Setup: create a Supabase project; enable Google under Authentication Providers; configure OAuth credentials in Google Cloud; add the GitHub Pages URL to allowed redirects; create public.codequest_profiles with user_id UUID primary key referencing auth.users, progress JSONB not null default '{}', updated_at timestamp; enable RLS and policies that restrict select/insert/update to auth.uid() = user_id; put the Supabase project URL and anon/publishable key in auth-config.js. Never expose a service-role key in browser code. Until configured, local browser storage remains available.
