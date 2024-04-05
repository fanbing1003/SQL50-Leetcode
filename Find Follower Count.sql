CREATE TABLE leetcode.Followers (
	user_id int, 
    follower_id int
);

insert into leetcode.followers (user_id, follower_id)
values (0, 1), (1, 0), (2, 0), (2, 1);

select * from leetcode.followers;

select user_id, count(follower_id) as followers_count
from leetcode.followers
group by user_id
order by user_id asc;