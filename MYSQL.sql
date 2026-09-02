
use SqlJoins;
create table Authors(
author_id Int primary key,
first_name varchar(20),
last_name varchar(20),
birth_year int);
create table books (
book_id int primary key,
title varchar(20),
author_id int,
publication_year int,
price decimal(6,3));
desc books;
desc Authors;

insert into Authors (author_id, first_name, last_name,birth_year)
values 
(1,'jane','austen',1775),
(2,'george','orwell',1903),
(3,'ernest','hemingway',1899),
(4,'aganta','christie',1890),
(5,'jk','rowling',1965);
desc books;
alter table books modify column title varchar(40);
select * from Authors;
insert into books (book_id,title,author_id,publication_year,price)
values
(101,'pride and prejudice',1,1813,12.334),
(102,'1984',2,1949,14.59),
(103,'animal farm',2,1945,11.45),
(104,'the old man and the sea',3,1952,10.99),
(105,'murder on the orient express',4,1934,13.43),
(106,'death on the nile',4,1937,12.50),
(107,'emma',1,1815,11.99),
(108,'for whom the bell tolls',3,1940,15.64);
rename table Authors to authors;
select * from books;
select * from authors;

select a.first_name ,count(*)
from authors as a 
inner join books as b
on a.author_id = b.author_id group by a.first_name;

select b.publication_year
from authors as a
inner join books as b 
on a.author_id = b.author_id group by publication_year;

desc authors;
desc books;

create table categories (category_id int primary key, category_name varchar(20));
insert into categories (category_id,category_name)
values
(1,'fiction'),
(2,'classic'),
(3,'romance'),
(4,'political'),
(5,'mystery'),
(6,'adventure');
select * from categories;

create table book_categories(book_id int ,category_id int, primary key(book_id,category_id));
desc book_categories;

insert into book_categories(book_id,category_id)
values
(101,1),(101,2),(101,3), -- pride and prejudice : fiction , classic ,romance
(102,2),(102,3),(102,4), -- 1984 : fiction , classic , political
(103,1),(103,2),(103,4), -- animal farm : fiction,classic,political
(104,1),(104,2),(104,6),
(105,1),(105,5),
(106,1),(106,5),
(107,1),(107,2),(107,3),
(108,1),(108,2),(108,6);
select * from book_categories;

select c.category_name,count(*) 
from books as b
inner join book_categories as bc
on b.book_id = bc.book_id 
inner join categories as c
on bc.category_id = c.category_id 
inner join authors as a 
on b.author_id = a.author_id group by c.category_name;