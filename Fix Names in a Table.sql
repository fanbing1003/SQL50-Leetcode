create table leetcode.users3 (
	user_id int, 
    name char(15)
);

insert into leetcode.users3 (user_id, name)
values (1, 'aLice'),
	   (2, 'bOB');
       
select * from leetcode.users3;

select user_id, concat(upper(substring(name, 1, 1)), lower(substring(name, 2, length(name) - 1))) as name
from leetcode.users3;