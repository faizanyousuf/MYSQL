use SqlJoins;
create table customer (customer_id int primary key, customer_name varchar(100) not null,email varchar(100),city varchar(50));

create table orders(
order_id int primary key,
customer_id int,
order_date Date not null,
total_amount decimal(10,2),
constraint frn_key foreign key (customer_id) references customer(customer_id));

insert into customer (customer_id, customer_name,email,city) 
values 
(1,'john smith','johnsmith@gmail.com','new York'),
(2,'jana dane','janaDame342@gmail.com','Los Angeles'),
(3,'robert johnson','robertjohnson@gmail.com','chicago'),
(4,'emily davis','emilyDavis898@gmail.com','houston'),
(5,'michael brown','michaelbrown899@yahoo.com','phoenix');

insert into orders (order_id,customer_id,order_date,total_amount)
values
(101,1,'2023-01-23',150.24),
(102,3,'2023-01-16',89.34),
(103,1,'2024-02-23',45.25),
(104,2,'2023-01-25',210.30),
(105,3,'2023-02-02',75.00);

insert into orders values(107,2,'2022-',45.23);
select * from orders;

select * 
from customer as c
left join orders as o
on c.customer_id = o.customer_id;

create table shipping (
shipping_id int primary key,
order_id int,
shipping_date Date not null,
carrier varchar(50),
foreign key (order_id) references orders(order_id));

alter table shipping add tracking_number varchar(20);

insert into shipping 
values
-- (1001,101,'2023-02-13','fedex','fed3423413');
(1002,104,'2023-01-26','UPS','ups34234'),
(1003,105,'2023-03-24','USPS','usps983783');


select customer_name, count(*),sum(total_amount)
from customer as c
left join orders as o
on c.customer_id = o.customer_id group by customer_name having sum(total_amount) is not null;

select * 
from customer as c 
left join orders as o
on c.customer_id = o.customer_id
left join shipping as s
on o.order_id = s.order_id where o.order_id is not null AND s.shipping_id is not null;

select c.customer_id, c.customer_name,c.city, o.order_id,s.shipping_id
from customer as c 
left join orders as o
on c.customer_id = o.customer_id
left join shipping as s
on o.order_id = s.order_id where o.order_id is not null and c.city = "New York";

select *
from customer as c
left join orders as o
on c.customer_id = o.customer_id where curdate() - o.order_date > 30 or order_id is null;