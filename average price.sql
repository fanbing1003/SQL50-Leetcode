CREATE TABLE leetcode.prices (
	product_id int,
    start_date datetime,
    end_date datetime,
    price int
);
CREATE TABLE leetcode.unitssold (
	product_id int,
    purchase_date datetime,
    units int
);

insert into leetcode.prices (product_id, start_date, end_date, price)
values 
	(1, '2019-02-17', '2019-02-28', 5),
    (1, '2019-03-01', '2019-03-22', 20),
    (2, '2019-02-01', '2019-02-20', 15),
    (2, '2019-02-21', '2019-03-31', 30);
insert into leetcode.prices (product_id, start_date, end_date, price)
values
	(3, '2019-02-21', '2019-03-31', 30);
insert into leetcode.unitssold (product_id, purchase_date, units)
values 
	(1, '2019-02-25', 100),
    (1, '2019-03-01', 15),
    (2, '2019-02-10', 200),
    (2, '2019-03-22', 30);
select * from leetcode.prices;

select * from leetcode.prices a1 left join leetcode.unitssold a2
ON a1.product_id = a2.product_id
where a1.start_date <= a2.purchase_date and a2.purchase_date <= a1.end_date;

select DISTINCT a.product_id, round(COALESCE(a3.rev, 0), 2) as average_price
from leetcode.prices a left join 
(select a1.product_id, sum(a1.price*a2.units)/sum(a2.units) as rev
from leetcode.prices a1 left join leetcode.unitssold a2
on a1.product_id = a2.product_id
where a1.start_date <= a2.purchase_date and a2.purchase_date <= a1.end_date
group by a1.product_id) a3
on a.product_id = a3.product_id;
