CREATE TABLE leetcode.signups (
	user_id int,
    time_stamp datetime
);
insert into leetcode.signups (user_id, time_stamp)
values
	(3, '2020-03-21 10:16:13'),
    (7, '2020-01-04 13:57:59'),
    (2, '2020-07-29 23:09:44'),
    (6, '2020-12-09 10:39:37');

CREATE TABLE leetcode.Confirmations (
	user_id int,
    time_stamp datetime,
    act char(10)
);

insert into leetcode.confirmations (user_id, time_stamp, act)
values
	(3, '2021-01-06 03:30:46', 'timeout'),
    (3, '2021-01-06 03:30:46', 'timeout'),
    (7, '2021-01-06 03:30:46', 'confirmed'),
    (7, '2021-01-06 03:30:46', 'confirmed'),
    (7, '2021-01-06 03:30:46', 'confirmed'),
    (2, '2021-01-06 03:30:46', 'confirmed'),
    (2, '2021-01-06 03:30:46', 'timeout');

Select a1.user_id, COALESCE(round(a2.confirmation_rate, 2), 0.00) as confirmation_rate
from leetcode.signups as a1 left join 
(
select 
	user_id, 
    count(case when act = 'confirmed' then 1 end)/count(user_id) as confirmation_rate
from leetcode.confirmations
group by user_id
) as a2
on a1.user_id = a2.user_id;










