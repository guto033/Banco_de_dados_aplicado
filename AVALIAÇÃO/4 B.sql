begin;

update pedidos
set status = 'SAIU_ENTREGA',
    observacao = 'Teste'
where id = 2
  and status = 'PREPARANDO';

insert into historico_status
    (pedido_id, status_anterior, status_novo, motivo, data_alteracao)
values
    (2, 'PREPARANDO', 'SAIU_ENTREGA', 'Teste', '2026-09-17 21:42:00');

select *from pedidos
where id = 2;

select *from historico_status
where pedido_id = 2;

commit;

select *from pedidos
where id = 2;

select *from historico_status
where pedido_id = 2;