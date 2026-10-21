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
create table if not exists public.ai_usage (
  user_id uuid not null references auth.users(id) on delete cascade,
  usage_date date not null default current_date,
  requests integer not null default 0 check (requests >= 0),
  primary key(user_id, usage_date)
);
alter table public.user_progress enable row level security;
alter table public.profiles enable row level security;
alter table public.lesson_passes enable row level security;
alter table public.certificates enable row level security;
alter table public.ai_usage enable row level security;
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
drop policy if exists "users read own AI usage" on public.ai_usage;
create policy "users read own AI usage" on public.ai_usage for select to authenticated using (auth.uid() = user_id);
create or replace function public.take_ai_request(p_user_id uuid, p_limit integer default 20)
returns boolean language plpgsql security definer set search_path=public as $$
declare n integer;
begin
  insert into public.ai_usage(user_id, usage_date, requests) values (p_user_id,current_date,1)
  on conflict(user_id,usage_date) do update set requests=public.ai_usage.requests+1
  returning requests into n;
  return n <= p_limit;
end; $$;
revoke all on function public.take_ai_request(uuid,integer) from public;
grant execute on function public.take_ai_request(uuid,integer) to service_role;
grant select,insert,update,delete on public.user_progress to authenticated;
grant select,insert,update on public.profiles to authenticated;
grant select on public.profiles to anon;
grant select on public.lesson_passes, public.certificates, public.ai_usage to authenticated;
