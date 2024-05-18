create table leetcode.Movies (
	movie_id int, 
    title char(20));
    
create table leetcode.Users2 (
	user_id int, 
    name char(20));

create table leetcode.MovieRating (
	movie_id int, 
    user_id int,
    rating int,
    created_at date);
    
insert into leetcode.movies (movie_id, title)
values 
	(1, 'Avengers'),
    (2, 'Frozen 2'),
    (3, 'Joker');

insert into leetcode.Users2 (user_id, name)
values 
	(1, 'Daniel'),
    (2, 'Monica'),
    (3, 'Maria'),
    (4, 'James');
    
insert into leetcode.movierating (movie_id, user_id, rating, created_at)
values 
	(1, 1, 3, '2020-01-12'),
    (1, 2, 4, '2020-02-22'),
    (1, 3, 2, '2020-02-12'),
    (1, 4, 1, '2020-01-01'),
    (2, 1, 5, '2020-02-17'),
    (2, 2, 2, '2020-02-01'),
    (2, 3, 2, '2020-03-01'),
    (3, 1, 3, '2020-02-22'),
    (3, 2, 4, '2020-02-25');
    
select * from leetcode.movies;
select * from leetcode.Users2;
select * from leetcode.movierating;



select (
	select U.name as results
	from leetcode.movierating R join leetcode.Users2 U
	on R.user_id = U.user_id
	group by R.user_id, U.name
	order by count(*) desc, U.name asc
	limit 1) as results
union all
select (
	select M.title 
	from leetcode.movierating R join leetcode.movies M 
	on R.movie_id = M.movie_id
	where DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
	group by title
	order by avg(rating) desc, M.title asc
	limit 1) as results;