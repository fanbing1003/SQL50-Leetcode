create table leetcode.Courses (
	student char(15),
    class char(15)
);

insert into leetcode.Courses (student, class)
values 
	('A', 'Math'),
    ('B', 'English'),
    ('C', 'Math'),
    ('D', 'Biology'),
    ('E', 'Math'),
    ('F', 'Computer'),
    ('G', 'Math'),
    ('H', 'Math'),
    ('I', 'Math');
    
select class
from leetcode.courses
group by class
having count(class) >= 5;