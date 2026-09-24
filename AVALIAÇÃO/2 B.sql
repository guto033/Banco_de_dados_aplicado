select r.nome, p.nome,p.preco,
       (select avg(p2.preco) from produtos p2
        where p2.restaurante_id = p.restaurante_id) as media_precos
from produtos p
inner join restaurantes r
    on p.restaurante_id = r.id
where p.preco > (
    select avg(p2.preco)
    from produtos p2
    where p2.restaurante_id = p.restaurante_id
);