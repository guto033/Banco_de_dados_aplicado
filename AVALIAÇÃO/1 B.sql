select nome,categoria,avaliacao,
case
    when avaliacao >= 4.7 THEN 'EXCELENTE'
    when avaliacao >= 4.3 THEN 'MUITO BOM'
    when avaliacao >= 4.0 THEN 'BOM'
    else 'ATENÇÃO'
end as classificacao
FROM restaurantes
WHERE ativo = true;