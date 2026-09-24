select p.id, c.nome, r.nome, pr.nome, ip.quantidade,ip.preco_unitario,
ip.quantidade * ip.preco_unitario as total
from pedidos p

inner join clientes c
    on p.cliente_id = c.id

inner join restaurantes r
    on p.restaurante_id = r.id

inner join itens_pedido ip
    on p.id = ip.pedido_id

inner join produtos pr
    on ip.produto_id = pr.id
    
where p.status = 'ENTREGUE';

