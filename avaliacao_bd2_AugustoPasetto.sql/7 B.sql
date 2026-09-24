create table avaliacao_delivery.pedidos_2025
partition of pedidos_historico_part
for values from ('2025-01-01') to ('2026-01-01');

create table avaliacao_delivery.pedidos_2026_s1
partition of pedidos_historico_part
for values from ('2026-01-01') to ('2026-07-01');

create table avaliacao_delivery.pedidos_2026_s2
partition of pedidos_historico_part
for values from ('2026-07-01') to ('2027-01-01');