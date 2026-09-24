select id,data_pedido,status,canal,taxa_entrega,desconto
from pedidos
where canal = 'APP' and status in ('PREPARANDO', 'SAIU_ENTREGA')
and data_pedido >= '2026-01-01'
and data_pedido < '2027-01-01'
order by data_pedido desc;