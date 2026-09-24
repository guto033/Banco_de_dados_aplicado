create or replace function avaliacao_delivery.fn_total_pedido(pedido_id int)
returns numeric 
language plpgsql
as $$
declare total numeric;
begin
    select sum(ip.quantidade * ip.preco_unitario), 0 + p.taxa_entrega - p.desconto
    into total
    from avaliacao_delivery.pedidos p
    left join itens_pedido ip on ip.pedido_id = p.pedido_id
    where p.pedido_id = pedido_id
    group by p.taxa_entrega, p.desconto;

    return total;
end;
$$;

select fn_total_pedido(1);