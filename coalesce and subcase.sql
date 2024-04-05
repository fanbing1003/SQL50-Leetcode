SELECT * FROM leetcode.student;
select * 
from leetcode.student 
join leetcode.subjects;

select student_id, subject_name, count(subject_name) as num
From leetcode.examinations
group by student_id, subject_name;

select table_a.student_id, table_a.student_name, table_a.subject_name, COALESCE(table_b.num, 0) as attended_exams 
from (
	select * 
	from leetcode.student 
		join leetcode.subjects) as table_a
	left join (
	select student_id, subject_name, count(subject_name) as num
	From leetcode.examinations
	group by student_id, subject_name) as table_b
on table_a.student_id = table_b.student_id and table_a.subject_name = table_b.subject_name
order by table_a.student_id , table_a.subject_name;