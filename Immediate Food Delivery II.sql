create table leetcode.delivery (
	delivery_id int,
    customer_id int,
    order_date date,
    customer_pref_delivery_date date
);

insert into leetcode.delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values 
	(1, 1, '2019-08-01', '2019-08-02'),
    (2, 2, '2019-08-02', '2019-08-02'),
    (3, 1, '2019-08-11', '2019-08-12'),
    (4, 3, '2019-08-24', '2019-08-24'),
    (5, 3, '2019-08-21', '2019-08-22'),
    (6, 2, '2019-08-11', '2019-08-13'),
    (7, 4, '2019-08-09', '2019-08-09');
    
select * from leetcode.delivery;
select 
	*
from leetcode.delivery t1 join
(select customer_id, min(order_date) as first_order
from leetcode.delivery
group by customer_id) t2
on t1.customer_id = t2.customer_id and t1.order_date = t2.first_order;

select 
	round(count(case when t2.first_order = t1.customer_pref_delivery_date then 1 else null end)*100/count(delivery_id), 2)
    as immediate_percentage
from leetcode.delivery t1 join
(select customer_id, min(order_date) as first_order
from leetcode.delivery
group by customer_id) t2
on t1.customer_id = t2.customer_id and t1.order_date = t2.first_order;