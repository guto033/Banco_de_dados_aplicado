select c.nome, c.ativo 
from clientes c 
where c.ativo = true 
and not exists (
select * from emails_bloqueados eb 
where eb.email = c.email
);
