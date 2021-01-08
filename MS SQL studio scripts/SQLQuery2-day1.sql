
---------------------------------------------------
-------------------------------
---------------create table---
create database dbemployee873assignment
use dbemployee873assignment
	create table customertable(Cid int constraint Cust_id Primary Key,first_name nvarchar(40),last_name nvarchar(40),city nvarchar(40),country nvarchar(40),Phone nvarchar(40))
	create table ProductTable(Pid int constraint Product_id primary key, Prod_name nvarchar(50), unitprice nvarchar(30),Package nvarchar(30),IsDiscontinued bit)
	create table OrderTable(Oid int primary key,orderdate datetime,orderNumb nvarchar(10),customerID int references customertable(Cid),TotalAmount decimal(12,2))
	create table OrderitemTable(OtId int primary key,Orderid int references ordertable(Oid),Productid int references producttable(pid),unit_priceoforder decimal(12,2),Quantity int)
------Insert Records in all tables----
	insert into  customertable(Cid,First_name,last_name,city,country,Phone) values(101,'Tom','Curran','London','England',9525665112),(102,'Sam','kumar','paris','france',36667889),(103,'siya','devi','berlin','germany',567891),(104,'suma','shree','delhi','india',1597253)
	insert into Producttable(Pid,Prod_name,unitprice,Package,IsDiscontinued) values (01,'kitkat',120,'small',1),(02,'lays',50,'mini',0),(03,'chocos',210,'macro',1),(04,'cadbury',237,'big',1)
	insert into ordertable(Oid,orderdate,ordernumb,customerID,TotalAmount) values (1001,'2005-05-06 08:15:45.25',568411,103,4500),(1002,'2015-12-06 18:45:55.25',5478931,101,5204),(1003,'2018-01-06 12:20:29.25',45741237,102,6144),(1004,'2011-06-10 16:14:12.50',15972315,104,5245)
	insert into orderitemtable(Otid,orderid,productid,unit_priceoforder,quantity) values (201,1001,02,1236.2,150),(202,1003,01,156.23,510),(203,1002,03,3247,751),(204,1003,02,4658,271)
--------In Customer table FirstName Attribute should not accept null value

	alter table customertable alter column first_name nvarchar(30) not null
	-------In Order table OrderDate should not accept null value

	alter table ordertable alter column orderdate datetime not null
	----Display all customer details

	select * from customertable
	-----write a query to display Country whose name starts with A or I
		select country from customertable where country like '[ai]%'

------write a query to display whose name of customer whose third character is m
	
	select concat(first_name,last_name) [name] from customertable where fisrt_name like '__m%'

-----Display the details from Customer table who is from country Germany
	
	select * from customertable where country = 'Germany'
	---Display the fullname of the employee

	select concat(first_name, ' ',last_name) [FullName] from customertable
	---display the customer details whoes name holds second letter as U
	select * from customertable where first_name like '_[u]%'
	---select order Details where unit price is greater than 1500 and less than 20000----------(?)
	select * from orderitemtable where unit_priceoforder > 1500 and unit_priceoforder < 20000
	----- Display order details which contains shipping date and arrange the order by date--------(?)
	select * from ordertable order by orderdate
	---------------------
	sp_help orderitemtable
	sp_help ordertable
	sp_help customertable
	sp_help producttable
	----------------------------eg:: name of customer,the ordered product name  with its 
	select customertable.first_name,producttable.Prod_name,OrderTable.orderNumb,OrderitemTable.