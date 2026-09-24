create table avaliacao_delivery.pedidos_historico_part (
    pedido_id int, 
    cliente_id int,
    restaurante_id int,
    data_pedido date,
    status varchar(50),
    canal varchar(50),
    valor_total numeric(10,2)
)
partition by range (data_pedido);