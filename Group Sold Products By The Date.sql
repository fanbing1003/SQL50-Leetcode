create table leetcode.activities (
	sell_date date, 
    product char(50)
);

insert into leetcode.activities (sell_date, product)
values 
	('2020-05-30', 'Headphone'),
    ('2020-06-01', 'Pencil'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'Basketball'),
    ('2020-06-01', 'Bible'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'T-Shirt');
    
select * from leetcode.activities;



select 
	sell_date, 
    count(distinct product) as num_sold,
    GROUP_CONCAT(distinct product order by product asc) as products
from leetcode.activities
group by sell_date, sell_date
order by sell_date asc

