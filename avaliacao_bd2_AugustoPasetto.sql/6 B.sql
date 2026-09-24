create role suporte_delivery with login password 'senha_suporte_bi_delivery';

grant usage on schema avaliacao_delivery to suporte_delivery;

grant select on clientes to suporte_delivery;
grant select on pedidos to suporte_delivery;
grant select on pagamentos to suporte_delivery;

revoke update on pedidos from suporte_delivery;

grant update (status, observacao) on pedidos to suporte_delivery;