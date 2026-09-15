-- TAGS SECURE ADMIN POLICIES
-- Run this AFTER creating your admin user in Supabase Authentication.

alter table public.orders enable row level security;
revoke select, update, delete on table public.orders from anon;
grant select, update, delete on table public.orders to authenticated;

drop policy if exists "Temporary public order read" on public.orders;
drop policy if exists "Temporary public order update" on public.orders;
drop policy if exists "Temporary public order delete" on public.orders;
drop policy if exists "Admin can read orders" on public.orders;
drop policy if exists "Admin can update orders" on public.orders;
drop policy if exists "Admin can delete orders" on public.orders;

create policy "Admin can read orders" on public.orders for select to authenticated using (true);
create policy "Admin can update orders" on public.orders for update to authenticated using (true) with check (true);
create policy "Admin can delete orders" on public.orders for delete to authenticated using (true);

alter table public.products enable row level security;
revoke insert on table public.products from anon;
grant select on table public.products to authenticated;
grant insert on table public.products to authenticated;

drop policy if exists "Temporary product insert" on public.products;
drop policy if exists "Admin can read products" on public.products;
drop policy if exists "Admin can insert products" on public.products;

create policy "Admin can read products" on public.products for select to authenticated using (true);
create policy "Admin can insert products" on public.products for insert to authenticated with check (true);
