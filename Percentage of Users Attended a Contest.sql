CREATE TABLE leetcode.users (
	user_id int,
    user_name char(15)
);
CREATE TABLE leetcode.register (
	contest_id int,
    user_id int
);

insert into leetcode.users (user_id, user_name)
values (6, 'Alice'), (2, 'Bob'), (7, 'Alex');

insert into leetcode.register (contest_id, user_id)
values 
	(215, 6), 
	(209, 2),
    (208, 2),
    (210, 6),
    (208, 6),
    (209, 7),
    (209, 6),
    (215, 7),
    (208, 7),
    (210, 2),
    (207, 2),
    (210, 7);
    
select * from leetcode.users;
select * from leetcode.register;

select 
	distinct(R.contest_id), 
	round(count(R.contest_id)*100/(select count(user_id) from leetcode.users), 2) as percentage
from leetcode.register R left join leetcode.users U
on R.user_id = U.user_id
group by contest_id
order by percentage desc, , contest_id asc;

select R.contest_id, R.user_id, U.user_name
from leetcode.users U join leetcode.register R
on R.user_id = U.user_id
order by R.contest_id;