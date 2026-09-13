-- LEADS CONSOLE — таблицы для общей базы (Supabase → SQL Editor → вставить и Run)

create table if not exists leads (
  id text primary key,
  name text,
  niche text,
  city text,
  phone text,
  address text,
  rating text,
  reviews int default 0,
  website text,
  maps text,
  source text default 'google',
  note text,
  status text default 'новый',
  touched text,
  score int default 0,
  site text,
  weak text,
  rec text,
  tag text,
  message text,
  created_at timestamptz default now()
);

create table if not exists templates (
  id text primary key default 'default',
  food text,
  stay text,
  local text,
  weak text
);

-- RLS включён, но политика открытая — доступ даёт сам факт знания
-- ANON_KEY и адреса Vercel (тот же принцип, что и noindex на сайте).
-- Не публикуй эти два значения дальше себя и сестры.
alter table leads enable row level security;
alter table templates enable row level security;

create policy "anon full access leads" on leads
  for all using (true) with check (true);
create policy "anon full access templates" on templates
  for all using (true) with check (true);
