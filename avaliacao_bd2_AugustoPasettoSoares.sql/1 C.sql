
select cidade, count (id_cliente) as total_clientes,
sum(case when ativo = true then 1 else 0) as clientes_ativos,
sum(case when ativo = false then 1 else 0) as clientes_inativos
from clientes
group by cidade;
