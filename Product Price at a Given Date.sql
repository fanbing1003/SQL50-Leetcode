create table leetcode.products (
	product_id int, 
    new_price int,
    change_date date
	);
insert into leetcode.products (product_id, new_price, change_date)
values 
	(1, 20, '2019-08-14'),
    (2, 50, '2019-08-14'),
    (1, 30, '2019-08-15'),
    (1, 35, '2019-08-16'),
    (2, 65, '2019-08-17'),
    (3, 20, '2019-08-18');
    
select * from leetcode.products;

select t1.product_id, t2.latest from (select distinct product_id from leetcode.products) t1 left join
(select product_id, max(change_date) as latest
from leetcode.products
where change_date <= '2019-08-16'
group by product_id) t2
on t1.product_id = t2.product_id;



select t2.product_id, coalesce(new_price, 10) as price
from leetcode.products t1
right join (
	select t1.product_id, t2.latest from (select distinct product_id from leetcode.products) t1 left join
	(select product_id, max(change_date) as latest
	from leetcode.products
	where change_date <= '2019-08-16'
	group by product_id) t2
	on t1.product_id = t2.product_id
) t2 
on t1.product_id = t2.product_id and t1.change_date = t2.latest;