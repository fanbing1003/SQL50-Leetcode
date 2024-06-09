create table leetcode.users4 (
	user_id int, 
    name char(50),
    mail char(50)
);

insert into leetcode.users4 (user_id, name, mail)
values
	(1, 'Winston', 'winston@leetcode.com'),
    (2, 'Jonathan', 'jonathanisgreat'),
    (3, 'Annabelle', 'bella-@leetcode.com'),
    (4, 'Sally', 'sally.come@leetcode.com'),
    (5, 'Marwan', 'quarz#2020@leetcode.com'),
    (6, 'David', 'david69@gmail.com'),
    (7, 'Shapiro', '.shapo@leetcode.com');
    
select * from leetcode.users4;

select * from leetcode.users4
where  mail RLIKE '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$';
