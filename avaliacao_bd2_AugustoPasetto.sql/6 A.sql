create role bi_delivery with login password 'senha_bi_delivery';

grant usage on schema avaliacao_delivery TO bi_delivery;

grant select on clientes to bi_delivery;
grant select on restaurantes to bi_delivery;
grant select on pedidos to bi_delivery;
grant select on itens_pedido to bi_delivery;
grant select on vw_painel_pedidos to bi_delivery;

revoke insert, update, delete on pedidos from bi_delivery;