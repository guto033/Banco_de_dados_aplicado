-- TESTE 1:
-- Cancelamento válido
CALL sp_cancelar_pedido(10, 'Solicitação de cancelamento');

-- Resultado esperado:

-- Pedido 10 deve ficar com o status = 'CANCELADO'
-- A coluna observação deve registrar o motivo 'Solicitação de cancelamento'
-- Em historico_status deve ser criado um novo registro
-- Caso houver um pagamento "APROVADO", o sistema deve mudar para "ESTORNADO"



-- TESTE 2: 
-- Tentativa de cancelar pedido ENTREGUE
CALL sp_cancelar_pedido(20, 'Cancelamento');

-- ERRO, pois o pedido já foi entregue


-- TESTE 3: 
-- Tentativa de cancelar pedido já CANCELADO
CALL sp_cancelar_pedido(10, 'Tentativa de cancelar novamente');

-- ERRO, pois o pedido já está cancelado
