create or replace function avaliacao_delivery.fn_total_gasto_cliente(cliente_id int)
returns numeric
language plpgsql
as $$
declare total numeric;
begin
    select coalesce(sum(fn_total_pedido(p.pedido_id)), 0)
    into total
    from pedidos p
    where p.cliente_id = cliente_id
    and p.status in ('PREPARANDO', 'SAIU_ENTREGA', 'ENTREGUE');

    return total;
end;
$$;

select fn_total_gasto_cliente(1);