-- Camino crítico PFC-2026: estado compartido de cada tarea
create table if not exists camino_estado (
  id text primary key,
  e  text not null check (e in ('pendiente','en_curso','cerrada')),
  t  bigint
);
grant select, insert, update, delete on camino_estado to anon, authenticated;
alter table camino_estado enable row level security;
drop policy if exists "equipo_camino" on camino_estado;
create policy "equipo_camino" on camino_estado for all using (true) with check (true);
alter publication supabase_realtime add table camino_estado;
