create table leetcode.Triangle (x int, y int, z int);
insert into leetcode.triangle (x, y, z)
values 
	(13, 15, 30),
    (10, 20, 15);

select * from leetcode.triangle;

select x, y, z, (x + y > z) + (x + z > y) + (y + z > x) as triangle
from leetcode.triangle
WHERE (x + y > z) + (x + z > y) + (y + z > x) = 3;



select x, y, z, 
	case 
		when (x + y > z) + (x + z > y) + (y + z > x) = 3 then 'YES'
		ELSE 'No'
		end as triangle
from leetcode.triangle;


