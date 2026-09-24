rollback;

begin;

update pedidos
set status = 'SAIU_ENTREGA',
    observacao = 'Teste'
where id = 1;

select * from pedidos
where id = 1;

select * from historico_status
where pedido_id = 1;

rollback;

select * from pedidos
where id = 1;

select * from historico_status
where pedido_id = 1;