create table leetcode.Teacher (
	teacher_id int,
    subject_id int,
    dept_id int
);

insert into leetcode.Teacher (teacher_id, subject_id, dept_id)
values 
	(1, 2, 3),
	(1, 2, 4),
	(1, 3, 3),
	(2, 1, 1),
	(2, 2, 1),
	(2, 3, 1),
	(2, 4, 1);

select teacher_id, count(distinct subject_id) as cnt
from leetcode.teacher
group by teacher_id