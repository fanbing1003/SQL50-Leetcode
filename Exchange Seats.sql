create table leetcode.seat (id int, student char(20));
insert into leetcode.seat (id, student)
values 
	(1, 'Abbot'),
    (2, 'Doris'),
    (3, 'Emerson'),
    (4, 'Green'),
    (5, 'Jeames');
insert into leetcode.seat (id, student)
values 
	(6, 'Julia');


select * from leetcode.seat;

select (id - 1) as id , student from leetcode.seat
where id % 2 = 0;

select (id + 1) as id , student from leetcode.seat
where id % 2 <> 0;

select case 
	when (select count(id) from leetcode.seat) % 2 = 0 and id % 2 = 0 then id - 1
    when (select count(id) from leetcode.seat) % 2 = 0 and id % 2 = 1 then id + 1
	when (select count(id) from leetcode.seat) % 2 = 1 and id % 2 = 0 and id <> (select max(id) from leetcode.seat) then id - 1
    when (select count(id) from leetcode.seat) % 2 = 1 and id % 2 = 1 and id <> (select max(id) from leetcode.seat) then id + 1
    end as id,
	student
from leetcode.seat
group by id, student
order by id;

