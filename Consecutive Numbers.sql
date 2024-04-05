create table leetcode.logs (id int, num char(3));
insert into leetcode.logs (id, num)
values 
	(1, '1'),
    (2, '1'),
    (3, '1'),
    (4, '2'),
    (5, '1'),
    (6, '2'),
    (7, '2');
insert into leetcode.logs (id, num)
values 
	(9, '-1'),
    (10, '-1'),
    (11, '-1');

select * from leetcode.logs;

# First table
select t1.id as t1_id, t1.num as t1_num, t2.id as t2_id, t2.num as t2_num
from leetcode.logs t1 left join leetcode.logs t2 
on t1.id + 1 = t2.id
having t1_num = t2_num;

# Second table
select *
from(
	select t1.id as t1_id, t1.num as t1_num, t2.id as t2_id, t2.num as t2_num
	from leetcode.logs t1 left join leetcode.logs t2 
	on t1.id + 1 = t2.id
	having t1_num = t2_num) a1
left join leetcode.logs a2
on a1.t2_id + 1 = a2.id;

# Final 
select distinct num as ConsecutiveNums from(
select *
from(
	select t1.id as t1_id, t1.num as t1_num, t2.id as t2_id, t2.num as t2_num
	from leetcode.logs t1 left join leetcode.logs t2 
	on t1.id + 1 = t2.id
	having t1_num = t2_num) a1
left join leetcode.logs a2
on a1.t2_id + 1 = a2.id
having a1.t1_num = a1.t2_num and a1.t2_num = a2.num) t;


