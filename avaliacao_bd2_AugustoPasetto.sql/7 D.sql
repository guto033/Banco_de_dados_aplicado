explain analyze select *
from pedidos_historico_part
where data_pedido >= '2026-05-01' and data_pedido < '2026-06-01';

-- A consulta utilizou a partição pedidos_2026_s1