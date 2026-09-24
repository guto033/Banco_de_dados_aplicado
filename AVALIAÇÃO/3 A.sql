create view vw_painel_pedidos as
select p.id, p.data_pedido, c.nome as cliente,c.cidade,r.nome as restaurante,
p.status,p.canal,e.nome as entregador,
    sum(ip.quantidade) as quantidade_total_itens,
    sum(ip.quantidade * ip.preco_unitario) as valor_itens,p.taxa_entrega,p.desconto,
    sum(ip.quantidade * ip.preco_unitario)
        + p.taxa_entrega
        - p.desconto as valor_final
from pedidos p
inner join clientes c
    on c.id = p.cliente_id
inner join restaurantes r
    on r.id = p.restaurante_id
left join entregadores e
    on e.id = p.entregador_id
inner join itens_pedido ip
    on ip.pedido_id = p.id
group by p.id,p.data_pedido,c.nome,c.cidade,r.nome,p.status,p.canal,
e.nome,p.taxa_entrega,p.desconto;