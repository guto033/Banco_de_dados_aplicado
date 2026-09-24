with total_pedidos as (
    select
        p.id,
        p.cliente_id,
        sum(ip.quantidade * ip.preco_unitario)
            + p.taxa_entrega
            - p.desconto as valor_total
    from avaliacao_delivery.pedidos p
    join avaliacao_delivery.itens_pedido ip
        on ip.pedido_id = p.id
    where p.status in (
        'PREPARANDO',
        'SAIU_ENTREGA',
        'ENTREGUE'
    )
    group by
        p.id,
        p.cliente_id,
        p.taxa_entrega,
        p.desconto
)
select
    cliente_id,
    sum(valor_total) as total_gasto
from total_pedidos
group by cliente_id
order by cliente_id;