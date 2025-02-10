show databases;
create database food_ordering_app;
use food_ordering_app;
show tables;

--creating customer table

create table customer(
fname varchar(20),
lname varchar(20),
custid integer primary key,
emailid varchar(20),
pwd varchar(20),
address varchar(20),
street varchar(20),
pincode integer,
gender varchar(20),
phoneno long,
allergy varchar(20));
describe customer;

--inserting data into customer table--

insert into customer(fname, lname, custid, emailid, pwd, address, street, pincode, gender,phoneno, allergy)
values('Aastha' ,'Pandey',1, 'aastha@email.com', 'password1', '123Main St', 'Apt4B', 12345, 'Female', 5551234, 'None'),
      ('Ankit' , 'Mishra', 2, 'ankit@email.com', 'password2', '456 Elm St', 'Unit 7', 54321, 'Male', 5555678, 'None'),
      ('Priti', 'Tiwari', 3, 'priti@email.com', 'Password3', '567 Pine St', 'Unit 5D', 98765, 'Female', 5559876, 'None');
 select *from customer;     
 
--creating cuisine table

create table cuisine(
cuisineid integer primary key,
cuisinename varchar(20));
describe cuisine;
--inserting data into cuisine table--

insert into cuisine(cuisineid, cuisinename)
values (1, 'indian'),
       (2, 'chinese'),
       (3, 'italian');

select *from cuisine;

--creating employee table

create table employee(
empid integer primary key,
fname varchar(20),
lname varchar(20),
dob varchar(20),
emailid varchar(20),
pwd varchar(20),
address varchar(20),
phoneno long,
gender varchar(20),
salary int);

describe employee;

--inserting data into employee table--

insert into employee(empid, fname, lname, dob, emailid, pwd, address, phoneno, gender, salary)
values (1, 'Michael', 'johnson', '1990-05-15', 'mike@email.com', 'emp_pass1', '789 Oak St', 5558765, 'Male', 50000),
       (2,  'Emily', 'Wilson', '1985-02-20', 'emily@email.com', 'emp_pass1', '567 Pine St', 5554321, 'Female', 45000),
	   (3, 'David' , 'Lee', '1988-09-10', 'david@email.com', 'emp_pass3', '654 Elm St', 5557890, 'Male', 48000);
       
select *from employee;

--creating chef table--

create table chef(
chefid  integer primary key,
chefname varchar(20),
address varchar(20),
street varchar(20),
phoneno varchar(20),
cuisineid integer,
empid integer,
emailid varchar(20),
pwd varchar(20),
salary int,
constraint fk_chef_cuisine
foreign key(cuisineid)
references cuisine(cuisineid) on delete cascade,
constraint fk_chef_employee
foreign key (empid)
references employee(empid) on delete cascade);

describe chef;

--inserting data into chef table--
insert into chef(chefid, chefname, address, street, phoneno, cuisineid, empid, emailid, pwd, salary)
values(1, 'chef Mario', '123 chef way', 'Apt 2C', '555-9876', 1,1,'mario@email.com','chef_pass1', 55000),
      (2,  'chef priya', '101 chef Rd', 'Apt 3A', '555-4321', 2,2, 'priya@email.com', 'chef_pass2', 51000),
      (3,   'chef kenji', '456 chef Ave' , 'Unit 4C', '555-3456',3,3, 'kenji@email.com', 'chef_pass3', 54000);
      
select *from chef;

--creating ingredient table

create table ingredient(
ingid integer primary key,
ingname varchar (20));

describe ingredient;

--inserting data into ingredient table--

insert into ingredient(ingid, ingname)
values(1,'Tomato'),
      (2, 'Rice'),
      (3, 'Noodles');
      
select *from ingredient;

--creating food table--

create table food(
foodid integer primary key,
foodname varchar(20),
price integer,
quantity integer,
foodavail varchar(20), 
cuisineid integer,
ingid integer,
chefid integer,
constraint fk_food_cuisine
foreign key(cuisineid)
references cuisine(cuisineid) on delete cascade,
constraint fk_food_ingredient
foreign key(ingid)
references ingredient(ingid) on delete cascade,
constraint fk_food_chef
foreign key(chefid)
references chef(chefid) on delete cascade);

describe food;

--inserting data into food table--

insert into food(foodid, foodname, price, quantity, foodavail, cuisineid, ingid, chefid)
values(1, 'pao bhaji', 12,20, 'Available',1,1,1),
      (2, 'Haka Noodles', 15,15, 'Available', 2,2,2),
      (3, 'pizza', 18,20, 'Available', 3,3,3);
 
 select*from food;
 
--creating drink table

create table drink(
drinkid integer primary key,
drinkname varchar(20),
price long,
quantity varchar(20),
drinkavail varchar(20));

describe drink;

--inserting data into drink table--

insert into drink(drinkid, drinkname, price, quantity, drinkavail)
values(1, 'coca-cola', 20, 2, 'Available'),
      (2, 'Sprite', 30, 3, 'Available'),
      (3, 'Orange Juice', 50, 5,'Available');
      
	select *from drink;

--creating delivery table

create table delivery(
delid integer primary key,
delname varchar(20),
vehicleno varchar(20),
delcharge integer,
deldate date,
deltime varchar(20),
custid integer,
empid integer,
constraint fk_delivery_customer
foreign key(empid)
references customer(custid) on delete cascade,
constraint fk_delivery_employee
foreign key(empid)
references employee(empid) on delete cascade);

describe delivery;

--inserting data into delivery table--

insert into delivery(delid,delname, vehicleno, delcharge, deldate, deltime, custid, empid)
values(1, 'Fast Delivery', 'DEL123', 5, '2023-10-13', '12:00PM', 1,1),
      (2, 'Express Deliver', 'DEl789', 7, '2023-10-14', '2:30PM', 2,2),
      (3, 'Standard Delivery', 'Del789',6, '2023-10-15', '2:45PM', 3,3);
      
select *from delivery;

--creating orders table

create table orders(
ordid integer primary key,
totalcost integer,
foodid integer,
drinkid integer,
delid integer,
constraint fk_orders_food
foreign key(foodid)
references food(foodid) on delete cascade,
constraint fk_orders_drink
foreign key(drinkid)
references drink(drinkid) on delete cascade,
constraint fk_orders_delivery
foreign key(delid)
references delivery(delid) on delete cascade);

describe orders;

--inserting data into orders table--

insert into orders(ordid, totalcost, foodid, drinkid,delid)
values(1,27,1,1,1),
      (2,30,2,2,2),
      (3,25,3,3,3);
      
select *from orders;

--creating payment table

create table payment(
payid integer primary key,
paymethod varchar(20),
custid integer,
ordid integer,
constraint fk_payment_customer
foreign key(custid)
references customer(custid) on delete cascade,
constraint fk_payment_orders
foreign key(ordid)
references orders(ordid) on delete cascade);

describe payment;

--inserting data into payment table--

insert into payment(payid, paymethod, custid, ordid)
values (1,'credit card', 1,1),
	   (2, 'cash', 2,2),
       (3, 'cash',3,3);
  
  select *from payment;