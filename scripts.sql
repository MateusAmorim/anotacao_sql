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

select *
from payment
where amount > (
	select avg(amount)
	from payment
    );

select *
from payment
where amount = (
	select max(amount)
	from payment
	where customer_id = 1
	);
	
SELECT * FROM customer
WHERE customer_id IN (
	select customer_id
	from payment
	group by customer_id
	having count(*) > 35
);

SELECT * 
FROM customer
WHERE customer_id = ANY (
	select customer_id
	from payment
	group by customer_id
	having count(*) > 35
);

-- criando view
create view vendas_por_cliente as
select
	cus.customer_id,
    cus.first_name,
    cus.last_name,
    pay.amount
from customer as cus
join payment as pay
	on cus.customer_id = pay.payment_id;
	
-- melhor forma de criar view
create or replace view vendas_por_cliente as
select
	cus.customer_id,
    cus.first_name,
    cus.last_name,
    pay.amount
from customer as cus
join payment as pay
	on cus.customer_id = pay.payment_id
order by pay.amount desc;

