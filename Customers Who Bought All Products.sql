create table leetcode.Customer (customer_id int, product_key int);
create table leetcode.Product2 (product_key int);

insert into leetcode.Customer (customer_id, product_key)
values
	(1, 5), 
    (2, 6), 
    (3, 5), 
    (3, 6), 
    (1, 6);
insert into leetcode.Product2 (product_key)
values (5), (6);

select * from leetcode.customer;
select * from leetcode.Product2;

select * 
from (select distinct customer_id from leetcode.customer) t1
join leetcode.product2 t2;


select a1.customer_id, a1.product_key, count
from (
	select * 
	from (select distinct customer_id from leetcode.customer) t1
	join leetcode.product2 t2
) a1 
left join (
	select *, count(*) as count
    from leetcode.customer
    group by customer_id, product_key
) a2
on a1.customer_id = a2.customer_id and a1.product_key = a2.product_key;

select customer_id from leetcode.customer
group by customer_id
having count(distinct product_key) = (select count(*) from leetcode.product2);


