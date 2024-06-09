create table leetcode.products2 (
	product_id int, 
    product_name char(50),
    product_category char(50)
);

create table leetcode.orders (
	product_id int, 
    order_date date,
    unit int
);

insert into leetcode.products2 (product_date, product_name, product_category)
values 
	(1, 'Leetcode Solutions', 'Book'),
    (2, 'Jewels of Stringology', 'Book'),
    (3, 'HP', 'Laptop'),
    (4, 'Lenovo', 'Laptop'),
    (5, 'Leetcode Kit', 'T-shirt');

select * from leetcode.products2;

insert into leetcode.orders (product_id, order_date, unit)
values 
	(1, '2020-02-05', 60),
	(1, '2020-02-10', 70),
    (2, '2020-01-18', 30),
    (2, '2020-02-11', 80),
    (3, '2020-02-17', 2),
    (3, '2020-02-24', 3),
    (4, '2020-03-01', 20),
    (4, '2020-03-04', 30),
    (4, '2020-03-04', 60),
    (5, '2020-02-25', 50),
    (5, '2020-02-27', 50),
    (5, '2020-03-01', 50);

select * from leetcode.orders;


select product_name, sum(unit) as unit
from(
	select t1.order_date, t2.product_name, t1.unit from leetcode.orders t1 join leetcode.products2 t2
	on t1.product_id = t2.product_id
	having t1.order_date <= "2020-02-29" and t1.order_date >= "2020-02-01") t3
group by product_name
having unit >= 100;

