create table leetcode.RequestAccepted(
	requester_id int, 
    accepter_id int,
    accept_date date
);

insert into leetcode.requestaccepted (requester_id, accepter_id, accept_date)
values 
	(1, 2, '2016/06/03'),
    (1, 3, '2016/06/08'),
    (2, 3, '2016/06/08'),
    (3, 4, '2016/06/09');
    
select * from leetcode.requestaccepted;

select id, count(id) as num 
from (
select requester_id as id from leetcode.requestaccepted
union all
select accepter_id as id from leetcode.requestaccepted) t
group by id
order by num desc
limit 1;