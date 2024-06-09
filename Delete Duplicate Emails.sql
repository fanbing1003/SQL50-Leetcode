create table leetcode.person (
	id int, 
    email char(255)
);

insert into leetcode.person (id, email)
values (1, 'john@example.com'),
	   (2, 'bob@example.com'),
       (3, 'john@example.com');
       
select * from leetcode.person;

delete t1 from leetcode.person t1, leetcode.person t2 
where t1.email=t2.email and t1.id > t2.id;