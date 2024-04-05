create table leetcode.MonthlyTransactions (
	id int,
    country char(15),
    state enum("approved", "declined"),
    amount int,
    trans_date date
);

insert into leetcode.MonthlyTransactions (id, country, state, amount, trans_date)
values 
	(121, 'US', 'approved', 1000, '2018-12-18'),
	(122, 'US', 'declined', 2000, '2018-12-19'),
	(123, 'US', 'approved', 2000, '2019-01-01'),
	(124, 'DE', 'approved', 2000, '2019-01-07');

select DATE_FORMAT(trans_date, '%Y-%m') from leetcode.monthlytransactions;

select 
	DATE_FORMAT(trans_date, '%Y-%m') as month, 
    country,
    count(id) as trans_count,
    count(case when state = 'approved' then 1 else null end) as approved_count,
    sum(amount) as trans_total_amount ,
    sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from leetcode.monthlytransactions
group by DATE_FORMAT(trans_date, '%Y-%m'), country;