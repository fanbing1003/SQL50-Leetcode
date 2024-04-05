create table leetcode.Activity2 (
	player_id int,
    device_id int,
    event_date date,
    games_played int
);

insert into leetcode.Activity2 (player_id, device_id, event_date, games_played)
values 
	(1, 2, '2016-03-01', 5),
	(1, 2, '2016-03-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);
    
select * from leetcode.activity2;

select round(count(distinct t1.player_id)/(select count(distinct player_id) from leetcode.activity2), 2) as fraction
from
	(select player_id, min(event_date) as first_date
	from leetcode.activity2 
	group by player_id) t1
join leetcode.activity2 t2
on t1.player_id = t2.player_id
WHERE DATE_ADD(t1.first_date, INTERVAL 1 DAY) = t2.event_date;
