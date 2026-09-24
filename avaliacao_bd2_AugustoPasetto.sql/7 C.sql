INSERT INTO pedidos_historico_part(
    pedido_id,
    cliente_id,
    restaurante_id,
    data_pedido,
    status,
    canal,
    valor_total
)

select p.id, p.cliente_id, p.restaurante_id, p.data_pedido, p.status, p.canal,
    sum(ip.quantidade * ip.preco_unitario) 
	+ p.taxa_entrega
	- p.desconto AS valor_total
from pedidos p
join itens_pedido ip ON ip.pedido_id = p.id


group by
    p.id,
    p.cliente_id,
    p.restaurante_id,
    p.data_pedido,
    p.status,
    p.canal,
    p.taxa_entrega,
    p.desconto;