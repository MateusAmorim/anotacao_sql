SELECT * FROM pessoas; --mostra todos os dados da tabela pessoas.
SELECT * FROM pessoas WHERE sigla_estado="SP"; --mostra todos os dados da tabela pessoas quando a sigla do estado for = "SP".
SELECT * FROM pessoas WHERE sigla_estado<>"SP"; --mostra todos os dados da tabela pessoas quando a sigla do estado for diferente de "SP".
SELECT * FROM pessoas WHERE qte_pontos=90; --mostra todos os dados da tabela pessoas quando qte_pontos=90.
SELECT primeiro_nome, ultimo_nome FROM pessoas WHERE sigla_estado="SP" AND camiseta_ou_chapeu="camiseta"; --mais de uma condição.
SELECT primeiro_nome, ultimo_nome FROM pessoas WHERE sigla_estado="SP" AND camiseta_ou_chapeu="camiseta" AND nome_time="azul";
SELECT primeiro_nome, ultimo_nome, sigla_estado FROM pessoas WHERE sigla_estado="SP" OR sigla_estado="MG"; --quando uma condição ou outra é verdadeira.
SELECT primeiro_nome, ultimo_nome, sigla_estado FROM pessoas WHERE NOT (sigla_estado="SP"); -- seleciona aqueles onde a sigla não é igual a "SP".
SELECT primeiro_nome, ultimo_nome, sigla_estado FROM pessoas WHERE  sigla_estado<>"SP"; --seleciona aqueles diferentes de "SP"
SELECT primeiro_nome, ultimo_nome, nome_time, sigla_estado FROM pessoas WHERE nome_time="vermelho" AND (sigla_estado="SP" OR sigla_estado="MG") ORDER BY sigla_estado;
SELECT primeiro_nome, ultimo_nome, sigla_estado FROM pessoas WHERE sigla_estado like "S%"; --seleciona aqueles que começam com "S" e termina qualquer outro caracter.
SELECT primeiro_nome, ultimo_nome, sigla_estado FROM pessoas WHERE sigla_estado like "%O"; --seleciona aqueles que começam com qualquer caracter e termina com "O".
SELECT primeiro_nome, ultimo_nome, sigla_estado FROM pessoas WHERE primeiro_nome like "%DANI%"; --seleciona aquele que possui "DANI" em qualquer lugar da string.
SELECT primeiro_nome, ultimo_nome, sigla_estado FROM pessoas WHERE primeiro_nome like "%DANI%" LIMIT 2; --seleleciona apenas os dois primeiros.
SELECT primeiro_nome, ultimo_nome, sigla_estado FROM pessoas WHERE primeiro_nome like "%DANI%" LIMIT 2 OFFSET 2; --pula os 2 primeiros e exibe os 2 primeiros que estão em seguida.
SELECT primeiro_nome, ultimo_nome, qte_pontos from pessoas ORDER by primeiro_nome asc; --ordenando de forma ascendente.
SELECT primeiro_nome, ultimo_nome, qte_pontos from pessoas ORDER by primeiro_nome DESC; --ordenando de forma descendente.
SELECT primeiro_nome, ultimo_nome, qte_pontos from pessoas ORDER by primeiro_nome DESC, ultimo_nome ASC; --ordenando uma coluna ascendente e outra descendente.
SELECT primeiro_nome, ultimo_nome, qte_pontos from pessoas ORDER by qte_pontos DESC;
select primeiro_nome from pessoas; --seleciona todos os primeiros nomes da tabela de pessoas.
select primeiro_nome, length(primeiro_nome)from pessoas;  --identifica quantidade de caracteres.
select DISTINCT(primeiro_nome) from pessoas order by primeiro_nome;  --identifica a quantidade de nomes distintos que existe na tabela de pessoas.
select count(*) FROM pessoas WHERE sigla_estado="SP"; --seleciona a quantidade de pessoas que tem a sigla_estado="SP".
SELECT primeiro_nome, ultimo_nome, pessoas.sigla_estado, nome_estado FROM pessoas INNER JOIN estados ON  pessoas.sigla_estado = estados.sigla_estado; --Ligando tabela pessoas com tabela estados.
SELECT * FROM pessoas JOIN estados; --unindo colunas de tabelas sem nenhuma ligação entre elas.
SELECT * FROM pessoas INNER JOIN estados ON pessoas.sigla_estado=estados.sigla_estado; --quando existe uma condição de igualdade ligando as duas tabelas.
SELECT * FROM pessoas LEFT JOIN estados ON pessoas.sigla_estado=estados.sigla_estado; --uni as colunas de tabelas mostrando valores nulos.
SELECT * FROM pessoas RIGHT JOIN estados ON pessoas.sigla_estado=estados.sigla_estado; --uni os estados e as pessoas que tem um estado associado a elas.
SELECT primeiro_nome , count(*) from pessoas group by primeiro_nome;   --cria grupo de pessoas com mesmo nome e conta quantas pessoas tem emcada grupo.
SELECT primeiro_nome , sigla_estado, count(*) from pessoas group by primeiro_nome , sigla_estado; --exibe a quantidade de pessoas com mesmo nome em cadfa estado.
SELECT sigla_estado, avg(qte_pontos) from pessoas group by sigla_estado; --"AVG" retorna a média dos valores de um grupo, ignorando os nulos.
SELECT sigla_estado, min(qte_pontos) from pessoas group by sigla_estado; --"MIN" retorna o menor valor de um grupo, ignorando os nulos.
SELECT sigla_estado, max(qte_pontos) from pessoas group by sigla_estado; --"MAX" retorna o maior valor dentro de cada grupo, ignorando nulos.
SELECT sigla_estado, sum(qte_pontos) from pessoas group by sigla_estado; --"SUM" soma todos os valores de um grupo, ignorando nulos.
SELECT qte_pontos+10 from pessoas where qte_pontos>70 --seleciona qte_pontos adicionando 10 quando qte_pontos for maior que 70.
SELECT primeiro_nome, ultimo_nome, qte_pontos from pessoas where qte_pontos>= (select max(qte_pontos) from pessoas); --quantidade maxima de pontos da tabela de pessoas.
SELECT lower(primeiro_nome), upper(ultimo_nome) from pessoas; --primeiro nome em letras minusculas e ultimo nome em letras maiusculas.
SELECT lower(primeiro_nome), substr(ultimo_nome,1,5) from pessoas; --separa os 5 primeiros caracteres do ultimo nome.
SELECT lower(primeiro_nome), substr(ultimo_nome,2) from pessoas; --apartir da posição 2.
SELECT lower(primeiro_nome), substr(ultimo_nome,-2) from pessoas; --ultimos caracteres de uma coluna.
SELECT lower(primeiro_nome), replace(ultimo_nome,"a","@@") from pessoas; --"REPLACE" substitui uma string por oltra(queise sensitive).
SELECT lower(primeiro_nome), replace(ultimo_nome,"e","") from pessoas; --ocultar um caracter.
SELECT max(cast(qte_pontos as int)) from pessoas; --"CAST" converte uma coluna de um tipo de dados para oltro.
SELECT primeiro_nome, upper(ultimo_nome) as sobrenome from pessoas; --"ALIAS"(AS)transforma o nome das colunas, ou tabelas, em um nome mais amigavel.
SELECT P.primeiro_nome, P.sigla_estado, E.nome_estado from pessoas as P inner JOIN estados as E on P.sigla_estado = E.sigla_estado;
INSERT INTO pessoas(primeiro_nome,ultimo_nome) VALUES("Dani", "Monteiro") --insere dados em tabela.
UPDATE pessoas SET qte_pontos=80 WHERE primeiro_nome="Danielle"; --"UPDATE" atualiza valores.
DELETE FROM pessoas WHERE primeiro_nome="Pedro"; --"DELETE" exclui dados da tabela.
show table status; --mostra a estrutura do banco de dados.
select
	ID_PILOTO,
   NM_PILOTO,
    case
		when DT_NASCIMENTO is null then now()
        else DT_NASCIMENTO
	end 'DT_NASCIMENTO',
    ID_PAIS,
    ID_EQUIPE
from 
	tb_piloto; --substitui valor de data nulo por data atual.


-- aulas Udemy 'Banco de Dados SQL do ZERO ao Avançado 2023'

 use sakila; 

 select actor_id,first_name,last_name 
 from actor 
 where actor_id <= 10
 order by last_name;

 select 
     customer_id,
     amount - (amount * 0.10) as '10% discount'
 from payment
 where customer_id = 1;

 select * from payment
 order by amount desc;
 where amount != 0.99;

 select * from address
 where district != 'Texas';

 select * from customer
 where store_id = 1 
 and active = 0;

 select * from payment
 where staff_id = 1
 or amount = 0.99;

 select * from payment
 where staff_id = 1
 and amount = 0.99
 and customer_id < 10;

 select * from payment
 where not staff_id = 1 
 and amount != 0.99
 and customer_id < 10;

 select *
 from address
 where district in (
     'Alberta',
     'Texas', 
     'California'
     );

 select *
 from payment
 where amount
 between 1.99
 and 3.99;

 select *
 from actor
 where first_name
 like 'alb%';

 select *
 from actor
 where first_name
 like '%c';

 select *
 from address
 where address2 
 is null;

 select *
 from actor
 limit 99, 11;

 select *
 from actor
 where first_name
 regexp '^a|^d';

 select *
 from actor
 where first_name
 regexp '^[gcr]a';

 select *
 from customer
 join payment
 on customer.customer_id = payment.payment_id;

 select 
     customer.customer_id,
     customer.first_name,
     customer.last_name,
     payment.rental_id,
     payment.amount
 from customer
 join payment
 on customer.customer_id = 
     payment.payment_id

 select 
     cus.customer_id,
     cus.first_name,
     cus.last_name,
     pay.rental_id,
     pay.amount
 from customer cus
 join payment pay
 on cus.customer_id = 
     pay.payment_id

 select 
     cus.customer_id,
     cus.first_name,
     cus.last_name,
     adr.address,
     pay.rental_id,
     pay.amount
 from customer cus
 join payment pay
     on cus.customer_id = 
         pay.payment_id
 join address adr
     on cus.customer_id =
         adr.address_id

 select 
     cus.customer_id,
     cus.first_name,
     cus.last_name,
     adr.address,
     pay.rental_id,
     pay.amount
 from customer cus
 right join payment pay
     on cus.customer_id = 
         pay.payment_id
 left join address adr
     on cus.customer_id =
         adr.address_id

 select 
     cus.customer_id,
     cus.first_name,
     cus.last_name,
     pay.amount,
     'VIP' as Status
 from customer cus
 join payment pay
     on cus.customer_id =
         pay.payment_id
     where pay.amount >= 10.99;

 union

 select 
     cus.customer_id,
     cus.first_name,
     cus.last_name,
     pay.amount,
     'NON VIP' as Status
 from customer cus
 join payment pay
     on cus.customer_id =
         pay.payment_id
     where pay.amount < 10.99;

insert into language
values(default, 'Portuguese', '2008-02-10 05:02:19');

insert into language
values
	(default, 'Portuguese', '2008-02-10 05:02:19'),
    (default, 'Spanish', '2009-02-10 05:02:19'),
    (default, 'Polish', '2010-02-10 05:02:19');
    
insert into country
values
	(default, 'Brasil2', '2035-02-15 04:44:00')
    
insert into city
values
	(default, 'Sao Paulo2', last_insert_id(), '2034-02-15 04:44:00')

-- criando copia de tabela
create table payment_backup as
select * from payment;    

-- atualisando registro
update payment
set
	amount = 15.99
where payment_id = 1

-- deletando um valor
delete from payment
where payment_id = 16041

-- funções
select 
	max(amount) as Maior,
    min(amount) as Menor,
    avg(amount) as Media
from payment;

select 
	max(amount) as Maior,
    min(amount) as Menor,
    avg(amount) as 'Media de Valores',
    sum(amount) as 'Total de Vendas',
    count(amount) as 'Numero de Vendas'
from payment
where staff_id = 2;

select 
	customer_id,
    sum(amount) as total
from payment
group by customer_id
order by total desc;

select 
	cus.customer_id as ID,
    cus.first_name as Nome,
    cus.last_name as Sobrenome,
    sum(amount) as Total
from payment py
join customer cus using(customer_id)
group by customer_id
order by Total desc;

select 
	cus.customer_id as ID,
    cus.first_name as Nome,
    cus.last_name as Sobrenome,
    sum(amount) as Total,
    count(amount) as Compras
from payment py
join customer cus using(customer_id)
group by customer_id
having Total >= 150 and Compras >= 35
order by Total desc;

