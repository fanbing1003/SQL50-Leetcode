create table leetcode.Queue (
	person_id int, 
    person_name char(15),
    weight int,
    turn int
	);

insert into leetcode.queue (person_id, person_name, weight, turn)
values 
	(5, 'Alice', 250, 1),
    (4, 'Bob', 175, 5),
    (3, 'Alex', 350, 2),
    (6, 'John Cena', 400, 3),
    (1, 'Winston', 500, 6),
    (2, 'Marie', 200, 4);
    
select * from leetcode.queue order by turn;

select t1.turn
from leetcode.queue t1 join leetcode.queue t2
on t1.turn >= t2.turn
group by t1.turn
having sum(t2.weight) <= 1000
order by t1.turn desc
limit 1;

select person_name 
from leetcode.queue 
where turn = 
	(select t1.turn
	from leetcode.queue t1 join leetcode.queue t2
	on t1.turn >= t2.turn
	group by t1.turn
	having sum(t2.weight) <= 1000
	order by t1.turn desc
    limit 1
);





