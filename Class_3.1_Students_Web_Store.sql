use Master
use Master
/* Drop a database */
-- Drop Database Web_Store


/* Create a database */
Create Database Web_Store
go
create database Web_Store

/* Select the database to work */
Use Web_Store
go
Use Web_store

/* Creatin tables */
Create Table Categories (
Cat_ID		int primary key,
Cat_Desc	varchar(50)
)
go
Insert into Categories Values (1,'Running Shoes')
Insert into Categories Values (2,'Football')
Insert into Categories Values (3,'Golf')
Insert into Categories Values (4,'Rugby')
Insert into Categories Values (5,'Accessories')



/******************************************/
Create Table Brands (
Bra_ID		int primary key,
Bra_Desc	varchar(50)
)

Insert into Brands Values (1,'Nike')
Insert into Brands Values (2,'Adidas')
Insert into Brands Values (3,'Puma')
Insert into Brands Values (4,'Dunlop')
Insert into Brands Values (5,'Patrick')



/******************************************/
Create Table Sizes (
Siz_ID		int primary key,
Siz_Desc	int not null
)

Insert into Sizes Values (1,1)
Insert into Sizes Values (2,2)
Insert into Sizes Values (3,3)
Insert into Sizes Values (4,4)
Insert into Sizes Values (5,5)
Insert into Sizes Values (6,6)



/******************************************/
Create Table Genders (
Gen_ID		int primary key identity(1,1),
Gen_Desc	varchar(20) not null
)

Insert into Genders Values ('Mens')
Insert into Genders Values ('Womens')
Insert into Genders Values ('Unisex')
Insert into Genders Values ('Kids')



/******************************************/
Create Table Colors (
Col_ID		int primary key identity(1,1),
Col_Desc	varchar(20) not null
)

Insert into Colors Values ('Blue')
Insert into Colors Values ('White')
Insert into Colors Values ('Blue')
Insert into Colors Values ('Green')
Insert into Colors Values ('Orange')
Insert into Colors Values ('Black')
Insert into Colors Values ('Red')
Insert into Colors Values ('Yellow')
Insert into Colors Values ('Pink')



/******************************************/
-- drop Table Products 
create Table Products (
Prod_ID		int identity(1,1) primary key,
Prod_Desc	varchar(50)	  not null,
Prod_Price	decimal(10,2) not null,
Cat_ID		int references Categories (Cat_ID),
Bra_ID		int references Brands	  (Bra_ID),
Siz_ID		int references Sizes	  (Siz_ID),
Gen_ID		int references Genders	  (Gen_ID),
Col_ID		int references Colors     (Col_ID),
)
go

/******************************************/
-- drop Table Customers
create Table Customers (
Cus_ID			int identity(1,1) primary key,
Cus_Nam		varchar(50),
Cus_Place_Born	varchar(50)
)
go

/******************************************/
-- drop Table Orders 
create Table Orders (
Ord_ID		int identity(1,1),
Ord_Dt		date,
Cus_id		int references Customers(Cus_ID),
Prod_ID		int references Products(Prod_ID)
)
go

/* Inserting data in the table */
Insert into Products values ('Nike Dart 10 X Mens Running Trainers',19.50,1,1,6,1,2)
Insert into Products values ('Nike Tri Fusion',59,1,1,5,1,3)
Insert into Products values ('Nike Dart',35,1,1,3,2,1)
Insert into Products values ('Nike England Home Shirt 2016',49.99,2,1,3,1,2)
Insert into Products values ('Nike England Home Shirt 2016',49.99,2,1,1,2,2)
Insert into Products values ('Nike Golf Tipped Polo',23,3,1,1,3,8)
Insert into Products values ('Nike Lunar',67.99,3,1,5,2,9)
Insert into Products values ('Nike Brasilia Boot bag',6.99,5,1,3,3,6) 
Insert into Products values ('Nike Barcelona Away Messi Shirt 2015',47.99,2,1,2,4,8)
Insert into Products values ('Nike T-Shirt',7.99,5,1,3,2,4)

Insert into Products values ('Adidas Springblade',25.90,1,2,6,1,5)
Insert into Products values ('Adidas Springblade',20.90,1,2,3,2,9)
Insert into Products values ('Adidas Springblade',15.25,1,2,1,4,7)
Insert into Products values ('Adidas Manchester Home Shirt 2016',49.99,2,2,2,4,7)
Insert into Products values ('Adidas Chelsea Away Shirt 2015',45.99,2,2,2,2,3)
Insert into Products values ('Adidas Real Madrid Home Shirt 2015',55.99,2,2,5,1,2)
Insert into Products values ('Adidas New Zealand All Blacks Away Shirt 2015',30,4,2,6,1,2)
Insert into Products values ('Adidas Incurza Elite Mens Rugby Boots',70,4,2,6,1,8)
Insert into Products values ('Adidas Golf Zip Top Junior',18,3,2,2,4,6)
Insert into Products values ('Adidas Golf Club',100,3,2,3,2,5)
Insert into Products values ('Adidas Golf Balls',10,3,2,4,3,2)
Insert into Products values ('Adidas Watch',40,5,2,3,3,7)
Insert into Products values ('Adidas Watch Juior',30,5,2,1,4,7)
Insert into Products values ('Adidas Sunglasses',71.99,5,2,5,1,6)
Insert into Products values ('Puma Faas 300 Ladies',28,1,3,4,1,6)
Insert into Products values ('Puma Ignite Dual',69.99,1,3,3,2,9)
Insert into Products values ('Puma Ignite Dual Junior',59.99,1,3,1,4,6)
Insert into Products values ('Puma Arsenal Home Shirt 2015',47.99,2,3,3,2,7)
Insert into Products values ('Puma Italy Away Shirt 2016',45,2,3,5,1,1)
Insert into Products values ('Puma Evo Speed Football Boots',119,2,3,5,1,8)
Insert into Products values ('Puma Evo Speed Football Boots',109,2,3,3,2,9)
Insert into Products values ('Puma Bag',10,5,3,3,4,4)
Insert into Products values ('Dunlop Golf Club',50,3,4,6,1,6)
Insert into Products values ('Dunlop Golf Club',10,3,4,4,4,3)
Insert into Products values ('Dunlop Golf Balls',49.99,3,4,3,4,6)
Insert into Products values ('Dunlop Golf T-Shit',18,3,4,2,3,2)
Insert into Products values ('Dunlop Golf Gloves',6.77,3,4,3,3,4)
Insert into Products values ('Dunlop Watch',200,5,4,2,4,1)
Insert into Products values ('Dunlop Watch Juior',30,5,4,6,1,4)
Insert into Products values ('Dunlop Sunglasses',149.99,5,4,3,2,9)
Insert into Products values ('Patrick Kicking Tee',3.47,4,5,3,1,6)
Insert into Products values ('Patrick Kicking Tee',2.45,4,5,1,2,5)
Insert into Products values ('Patrick Rugby Boots',40,4,5,4,4,3)
Insert into Products values ('Patrick Rugby Boots',40,4,5,2,3,4)
Insert into Products values ('Patrick Rugby Ball',20,4,5,4,4,6)
Insert into Products values ('Patrick Rugby Ball',17.99,4,5,4,4,7)
Insert into Products values ('Patrick Rugby Shorts',17.99,5,5,1,3,1)
Insert into Products values ('Patrick Rugby Shorts',15.99,5,5,3,2,2)
Insert into Products values ('Patrick Rugby Shorts',10.25,5,5,6,1,3)
Insert into Products values ('Patrick Rugby Hat',10.99,5,5,4,4,4)
go
Insert into Customers values ('Christian Bale','Tokyo')
Insert into Customers values ('Adele Laurine','NY')
Insert into Customers values ('Anthony Hopkins','London')
Insert into Customers values ('Chris Martin','Rio')
Insert into Customers values ('Gerard Butler','Berlin')
Insert into Customers values ('Emily Blunt','Berlin')
Insert into Customers values ('Anne Hathaway','Berlin')
Insert into Customers values ('Meryl Streep','London')
Insert into Customers values ('Johnny Depp','Roma')
Insert into Customers values ('Leonardo DiCaprio','Moscow')

go
Insert into orders values ('2016-01-01',1,1)
Insert into orders values ('2016-01-01',1,2)
Insert into orders values ('2016-01-09',1,3)
Insert into orders values ('2016-01-11',1,4)
Insert into orders values ('2016-01-12',1,5)
Insert into orders values ('2016-01-20',2,6)
Insert into orders values ('2016-01-25',2,7)
Insert into orders values ('2016-01-25',2,8)
Insert into orders values ('2016-01-26',2,9)
Insert into orders values ('2016-01-27',2,10)
Insert into orders values ('2016-01-27',2,10)
Insert into orders values ('2016-01-27',2,10)
Insert into orders values ('2016-02-04',3,11)
Insert into orders values ('2016-02-05',3,11)
Insert into orders values ('2016-02-06',3,11)
Insert into orders values ('2016-02-07',3,12)
Insert into orders values ('2016-02-08',3,13)
Insert into orders values ('2016-02-17',3,16)
Insert into orders values ('2016-02-17',3,21)
Insert into orders values ('2016-02-18',3,19)
Insert into orders values ('2016-02-18',3,26)
Insert into orders values ('2016-02-15',4,14)
Insert into orders values ('2016-02-20',4,15)
Insert into orders values ('2016-03-15',5,18)
Insert into orders values ('2016-03-20',5,19)
Insert into orders values ('2016-03-25',5,20)
Insert into orders values ('2016-03-28',5,20)
Insert into orders values ('2016-03-28',5,21)
Insert into orders values ('2016-04-01',6,22)
Insert into orders values ('2016-04-05',6,22)
Insert into orders values ('2016-04-10',6,23)
Insert into orders values ('2016-04-15',6,24)
Insert into orders values ('2016-04-20',6,25)
Insert into orders values ('2016-04-21',6,26)
Insert into orders values ('2016-04-01',7,26)
Insert into orders values ('2016-04-05',7,26)
Insert into orders values ('2016-04-10',7,26)
Insert into orders values ('2016-04-15',7,26)
Insert into orders values ('2016-03-20',8,27)
Insert into orders values ('2016-03-20',8,28)
Insert into orders values ('2016-04-01',8,29)
Insert into orders values ('2016-04-02',8,30)
Insert into orders values ('2016-04-03',8,31)
Insert into orders values ('2016-04-04',8,32)
Insert into orders values ('2016-04-05',8,33)
Insert into orders values ('2016-04-06',8,34)
Insert into orders values ('2016-04-07',8,35)
Insert into orders values ('2016-04-08',8,36)
Insert into orders values ('2016-04-09',8,37)
Insert into orders values ('2016-04-10',8,38)
Insert into orders values ('2016-04-11',8,39)
Insert into orders values ('2016-04-12',8,40)

Insert into orders values ('2016-01-02',9,01)
Insert into orders values ('2016-01-03',9,02)
Insert into orders values ('2016-02-02',9,03)
Insert into orders values ('2016-02-03',9,04)
Insert into orders values ('2016-01-10',9,41)
Insert into orders values ('2016-01-20',9,42)
Insert into orders values ('2016-02-10',9,43)
Insert into orders values ('2016-02-20',9,44)
Insert into orders values ('2016-03-10',9,45)
Insert into orders values ('2016-03-20',9,46)
Insert into orders values ('2016-04-10',9,47)
Insert into orders values ('2016-04-20',9,48)
Insert into orders values ('2016-05-10',9,49)
Insert into orders values ('2016-05-20',9,50)
Insert into orders values ('2016-01-02',10,01)
Insert into orders values ('2016-01-03',10,10)
Insert into orders values ('2016-02-02',10,15)
Insert into orders values ('2016-02-03',10,20)
Insert into orders values ('2016-01-10',10,25)
Insert into orders values ('2016-01-20',10,30)
Insert into orders values ('2016-02-10',10,35)
Insert into orders values ('2016-02-20',10,40)
Insert into orders values ('2016-03-10',10,45)
Insert into orders values ('2016-03-20',10,50)
Insert into orders values ('2016-04-10',10,13)
Insert into orders values ('2016-04-20',10,24)
Insert into orders values ('2016-05-10',10,36)
Insert into orders values ('2016-05-20',10,50)
Insert into orders values ('2016-03-02',10,02)
Insert into orders values ('2016-03-03',10,12)
Insert into orders values ('2016-03-02',10,14)
Insert into orders values ('2016-03-03',10,16)
Insert into orders values ('2016-03-10',10,18)
Insert into orders values ('2016-04-20',10,20)
Insert into orders values ('2016-04-10',10,22)
Insert into orders values ('2016-05-20',10,24)
Insert into orders values ('2016-05-10',10,26)
Insert into orders values ('2016-05-20',10,28)
Insert into orders values ('2016-05-10',10,30)


select * from Categories
select * from Brands
select * from Sizes
select * from Genders
select * from Colors
select * from Products
select * from Customers
select * from Orders

-- Exercices
-- 1)
select top 5 c.cus_nam
	,sum(p.prod_price) Total_Price
	from Customers c
	join Orders o on c.Cus_ID = o.Cus_id
	join Products p on o.Prod_ID = p.Prod_ID
	group by c.Cus_Nam
	order by 2 desc

-- 2)
	select c.cat_desc
	,count(o.ord_id) volume
	from Categories c
	join Products p on c.cat_id = p.Cat_ID
	join Orders o on o.Prod_ID = p.Prod_ID
	group by c.Cat_Desc
	order by 2 desc

-- 3) Addidas
	select top 1 b.bra_desc
	,count(o.ord_id) sells
	,sum(p.prod_price) Total_price
	from Brands b
	join Products p on p.Bra_ID = b.Bra_ID
	join Orders o on p.Prod_ID = o.Prod_ID
	group by b.Bra_Desc
	order by 3 desc

-- 4) Womens
	select top 1 g.Gen_Desc
	,count(o.ord_id) volume
	from Genders g
	inner join Products p on p.Gen_ID = g.Gen_ID
	inner join Orders o on o.Prod_ID = p.Prod_ID
	group by g.Gen_Desc
	order by 2 desc

-- 5)
	select Customers.cus_nam
	,count(Orders.Ord_Dt) volume
	from Customers
	inner join Orders on Customers.Cus_ID = Orders.Cus_id
	group by Cus_Nam
	order by volume desc

-- 6)
	select p.prod_desc
	,count(o.ord_id) volume_sold
	,sum(p.prod_price) total_sold
	from Products p
	inner join Orders o on p.Prod_ID = o.Prod_ID
	group by p.Prod_Desc
	order by 3 desc

-- 7)
	select c.cus_nam
	--,month(o.ord_dt) 'month_p'
	,avg(p.prod_price) 'volume'
	from Customers c
	full join Orders o on o.Cus_id = c.Cus_ID
	full join Products p on p.Prod_ID = o.Prod_ID
	GROUp by c.Cus_Nam
	

	select month(ord_dt) from Orders

-- 8)
	select c.Cus_nam
	,Max(o.ord_dt) last_date_purchase
	from Customers c
	full join Orders o on o.Cus_id = c.Cus_ID
	group by c.Cus_Nam
	order by last_date_purchase desc
