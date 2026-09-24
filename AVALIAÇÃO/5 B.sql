select id
from pedidos
limit 1;

explain analyse select *
from pedidos p
inner join itens_pedido i
on p.id = i.pedido_id
where p.id = 1;

create index idx_itens_pedido_pedido_id
on itens_pedido (pedido_id);

analyze itens_pedido;

explain analyse select *
from pedidos p
inner join itens_pedido i
on p.id = i.pedido_id
where p.id = 1;