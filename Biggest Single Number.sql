create table leetcode.MyNumber (num int);
insert into leetcode.MyNumber (num)
values (8), (8), (3), (3), (1), (4), (5), (6);
select * from leetcode.MyNumber;

select coalesce((
	select num
	from leetcode.MyNumber
	group by num
	having count(num) = 1
	order by count(num) asc, num desc
limit 1), null) as num;
