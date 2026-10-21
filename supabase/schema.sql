-- CodeQuest cloud schema. Run once in Supabase SQL Editor.
create extension if not exists pgcrypto;
create table if not exists public.user_progress (
  user_id uuid primary key references auth.users(id) on delete cascade,
  state jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
create table if not exists public.profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default 'Learner' check (char_length(display_name) between 1 and 35),
  xp integer not null default 0 check (xp >= 0),
  level integer not null default 1 check (level >= 1),
  rank text not null default 'Novice',
  streak integer not null default 0 check (streak >= 0),
  lessons_completed integer not null default 0 check (lessons_completed >= 0),
  updated_at timestamptz not null default now()
);
create table if not exists public.lesson_passes (
  user_id uuid not null references auth.users(id) on delete cascade,
  language text not null,
  lesson_index integer not null check (lesson_index between 0 and 4),
  verified_output text not null default '',
  verified_at timestamptz not null default now(),
  primary key(user_id, language, lesson_index)
);
create table if not exists public.certificates (
  certificate_id text primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  language text not null,
  issued_at timestamptz not null default now(),
  signature text not null
);
alter table public.user_progress enable row level security;
alter table public.profiles enable row level security;
alter table public.lesson_passes enable row level security;
alter table public.certificates enable row level security;
drop policy if exists "users read own progress" on public.user_progress;
create policy "users read own progress" on public.user_progress for select to authenticated using (auth.uid() = user_id);
drop policy if exists "users write own progress" on public.user_progress;
create policy "users write own progress" on public.user_progress for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "public can read leaderboard" on public.profiles;
create policy "public can read leaderboard" on public.profiles for select to anon, authenticated using (true);
drop policy if exists "users update own leaderboard profile" on public.profiles;
create policy "users update own leaderboard profile" on public.profiles for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "users edit own leaderboard profile" on public.profiles;
create policy "users edit own leaderboard profile" on public.profiles for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "users read own verified passes" on public.lesson_passes;
create policy "users read own verified passes" on public.lesson_passes for select to authenticated using (auth.uid() = user_id);
drop policy if exists "users read own certificates" on public.certificates;
create policy "users read own certificates" on public.certificates for select to authenticated using (auth.uid() = user_id);
grant select,insert,update,delete on public.user_progress to authenticated;
grant select,insert,update on public.profiles to authenticated;
grant select on public.profiles to anon;
grant select on public.lesson_passes, public.certificates to authenticated;
