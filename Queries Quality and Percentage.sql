create table leetcode.queries (
	qery_name char(15),
    position int,
    rating int);
    
insert into leetcode.queries (qery_name, position, rating)
values
	('Dog', 1, 5),
    ('Dog', 2, 5),
    ('Dog', 200, 1),
    ('Cat', 5, 2),
    ('Cat', 3, 3),
    ('Cat', 7, 4);
    
select * from leetcode.queries;

select count(case when rating < 3 then 1 else null end) as poor_query
from leetcode.queries
GROUP BY qery_name;


select 
qery_name, 
round(avg(rating/position), 2) as quality,
round(count(case when rating < 3 then 1 else null end)*100/count(qery_name), 2) as poor_query_percentage
from leetcode.queries
where qery_name is not null
group by qery_name;

# Better solution
select 
    query_name, 
    round(AVG(rating/position), 2) as quality,
    round(AVG(rating<3)*100, 2) as poor_query_percentage
from Queries
group by query_name;
