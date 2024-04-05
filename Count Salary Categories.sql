create table leetcode.Account (
	account_id int, 
    income int
    );
insert into leetcode.account (account_id, income)
values 
	(3, 108939),
    (2, 12747), 
    (8, 87709),
    (6, 91796);

select * from leetcode.account;
# 20000, 50000

select 'Low Salary' as category, 
	(select count(*) from leetcode.account where income < 20000) as accounts_count
union
select 'Average Salary' as category, 
	(select count(*) from leetcode.account where income >= 20000 and income <= 50000) as accounts_count
union
select 'High Salary' as category, 
	(select count(*) from leetcode.account where income > 50000) as accounts_count;