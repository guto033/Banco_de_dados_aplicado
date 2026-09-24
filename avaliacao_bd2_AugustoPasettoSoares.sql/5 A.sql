EXPLAIN ANALYZE
SELECT *
FROM pedidos
WHERE status = 'ENTREGUE'
  AND data_pedido >= TIMESTAMP '2026-05-01 00:00:00'
  AND data_pedido < TIMESTAMP '2026-06-01 00:00:00';

create idx_pedidos_status_data
on pedidos (status, data_pedido);

analyze pedidos;

-- Antes a consulta fazia a leitura sequencial,lendo toda a tabela pedidos.
-- O PostgreSQL passou a usar o índice criado para encontrar os registros de forma rápida, sem precisar percorrer toda a tabela.
-- Assim, acessou apenas os registros necessários.
-- O tempo caiu de 48,155 ms para 0,188 ms.