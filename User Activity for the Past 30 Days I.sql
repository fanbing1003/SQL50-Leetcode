create table leetcode.Activity3 (
	user_id int,
    session_id int,
    activity_date date,
    activity_type enum ('open_session', 'end_session', 'scroll_down', 'send_message')
);

insert into leetcode.Activity3 (user_id, session_id, activity_date, activity_type)
values 
	(1, 1, '2019-07-20', 'open_session'),
    (1, 1, '2019-07-20', 'scroll_down'),
    (1, 1, '2019-07-20', 'end_session'),
    (2, 4, '2019-07-20', 'open_session'),
    (2, 4, '2019-07-21', 'send_message'),
    (2, 4, '2019-07-21', 'end_session'),
    (3, 2, '2019-07-21', 'open_session'),
    (3, 2, '2019-07-21', 'send_message'),
    (3, 2, '2019-07-21', 'end_session'),
    (4, 3, '2019-06-25', 'open_session'),
    (4, 3, '2019-06-25', 'end_session');

select *
from leetcode.Activity3;

select *
from leetcode.Activity3
where activity_date < '2019-07-27' AND activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY);

select distinct activity_date, count(distinct user_id)
from leetcode.Activity3
where activity_date < '2019-07-27' AND activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY)
group by activity_date;
