create database DbSample
use DbSample
Create table DepartmentTable(Deptid int primary key,Dname nvarchar(20),Location nvarchar(20))

Create table EmployeeTable(Eid int primary key,Name nvarchar(20),
Age int,Gender nvarchar(20),salary int,mobile nvarchar(15),Password nvarchar(15),
Deptid int references DepartmentTable(Deptid))

insert into DepartmentTable values(101,'CSE','Pune'),(102,'PE','Chennai'),(103,'PCE','Hyderabad'),
(104,'MEC','Mumbai')
insert into EmployeeTable values(1,'Siya',21,'Female',45000,'987896345','abcdefg1',101),
(2,'Raj',25,'Male',15000,'7945612364','rajesh12',104),(3,'Sheena',28,'Female',55000,'8523697411','sheena123',103),
(4,'Charles',29,'Male',25000,'7412589645','charle12',102)
select * from EmployeeTable
select * from DepartmentTable