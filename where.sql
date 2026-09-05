use mydb;

show tables;
create table bookstore(
book_id int primary key ,
title varchar(100),
author varchar(50),
price decimal(10,2),
publication_date date,
category varchar(30),
in_stock int,
created_at timestamp default current_timestamp
);

insert into bookstore (book_id,title,author,price,publication_date,category,in_stock)
values
(1,'The mySql Guide','john smith', 29.99,'2023-01-15','technology',50),
(2,'Data science basics', 'sarah johnson',34.99,'2023-03-20','technology',30),
(3,'Mystery at midnight','michael brown' ,19.99,'2023-02-10','mystery',100),
(4,'cooking essentials','lisa anderson',24.99,'2023-04-05','cooking',75);
desc bookstore;

select * from bookstore where category = 'technology';

select * from bookstore where (price <= 25 or (price > 30 and category = 'technology'));

select * from bookstore where author like '%on' ; 
select * from bookstore where title like '%sql%';
select * from bookstore;
select * from bookstore where title like '_y%';

select * from bookstore where year(publication_date) = '2023' and price < (select avg(price) from bookstore);

select * from bookstore where category = 'technology' and title like '%data%' and in_stock > 50;

select * from bookstore where ((category = 'technology' and price > 30) or category = 'mystery' and price < 20);

select * from bookstore where (author like '%wn%' or author like '%son%') and (publication_date > '2023-03-01');

