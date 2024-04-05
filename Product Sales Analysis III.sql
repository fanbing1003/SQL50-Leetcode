create table leetcode.sales (
	sale_id int,
    product_id int,
    year int,
    quantity int, 
    price int
);

create table leetcode.product (
	sale_id int,
    product_name char(50)
);

insert into leetcode.sales (sale_id, product_id, year, quantity, price)
values 
	(1, 100, 2008, 10, 5000),
    (2, 100, 2009, 12, 5000), 
    (7, 200, 2011, 15, 9000);

insert into leetcode.product (sale_id, product_name)
values 
	(100, 'Nokia'),
    (200, 'Apple'),
    (300, 'Samsung');
    
select * from leetcode.sales;
select * from leetcode.product;

select t2.product_id, t1.first_transection as first_year, t2.quantity, t2.price
from (
	select product_id, min(year) as first_transection
	from leetcode.sales
	group by product_id
) t1 join
leetcode.sales t2
on t1.product_id = t2.product_id and t1.first_transection = t2.year;