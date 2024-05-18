create table leetcode.investments (
	pid int, 
    tiv_2015 float, 
    tiv_2016 float,
    lat float, 
    lon float
);

insert into leetcode.investments (pid, tiv_2015, tiv_2016, lat, lon)
values 
	(1, 10, 5, 10, 10),
    (2, 20, 20, 20, 20),
    (3, 10, 30, 20, 20),
    (4, 10, 40, 40, 40);
    
select * from leetcode.investments;

select sum(t1.tiv_2016) as tiv_2016
from (
	select t11.tiv_2015, t11.tiv_2016, t11.lat, t11.lon
    from leetcode.investments t11
    join (
	select tiv_2015
	from leetcode.investments 
	group by tiv_2015 
	having count(*) > 1) t12
    on t11.tiv_2015 = t12.tiv_2015) t1
join (
	select lat, lon
	from leetcode.investments
	group by lat, lon
	having count(*) = 1) t2
on t1.lat = t2.lat and t1.lon = t2.lon;




