create or replace procedure avaliacao_delivery.sp_cancelar_pedido(pedido_id int, motivo text)
language plpgsql
as $$
declare status_atual varchar;
begin
    select status into status_atual from pedidos where pedido_id = pedido_id;

    if not found then
        raise exception 'pedido não encontrado';
    end if;

    if status_atual = 'ENTREGUE' then
        raise exception 'pedido já foi entregue';
    end if;

    if status_atual = 'CANCELADO' then
        raise exception 'pedido já está cancelado';
    end if;

    update pedidos set status = 'CANCELADO', observacao = motivo where pedido_id = pedido_id;

   insert into historico_status (pedido_id, status_anterior, status_novo, motivo)
values (p_pedido_id, status_atual, 'CANCELADO', p_motivo);

    update pagamentos set status = 'ESTORNADO' where pedido_id = pedido_id and status = 'APROVADO';
end;
$$;
