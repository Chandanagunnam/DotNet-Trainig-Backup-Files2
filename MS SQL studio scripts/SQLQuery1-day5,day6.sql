---ex of using return----
alter proc proc_department
as
begin
return (select count(distinct(deptid)) from tbldepartment )
end
declare @totaldepartment int
exec @totaldepartment = proc_department
print @totaldepartment

---------------FUNCTIONS-----
/* CREATE FUNCTION [schema_name.]function_name (parameter_list) 
RETURNS data_type 
AS
BEGIN 
sql- statements 
RETURN value 
END */--
---fn cant return text,ntext,image,cursor,timestamp
---2 types of fn ---a.system defined fn -eg: count,max,min,cast,square,getdate,datepart (pink colour)
				-----b.user defined ---b1) saclar value fns(return single value)
									--- b2)table valued fns
									---we cant use ddl,dml inside a fn only dql (select) is used
--example1
alter function fun_bonuscalculation(@id int)
returns float
as 
begin
return(select 0.1 * salary as increment from EmployeeTable where eid = @id)
end
--exectn of example1
select eid,ename,salary,dbo.fun_bonuscalculation(eid) as DiwaliBonus from EmployeeTable
--ex 2
create function fun_tax(@id int)
returns float
as
begin
declare @AnnualSal int,@taxamount float
set @AnnualSal = (select (salary*12) from employeetable where eid = @id)
	if (@AnnualSal > 500000)
	begin
	set @taxamount = @AnnualSal *0.1
	end
	else
	begin
	set @taxamount = 0
	end
return @taxamount
end
select e.ename,e.salary,p.age,p.city,dbo.fun_tax(e.eid) [Tax to be Paid] 
from EmployeeTable e,epersonaldetailtbl p where p.eid = e.eid
---example using age find year of birth
alter function fun_YearOfBirth(@id int)
returns int
as
begin
return(select (datepart(year,getdate())-age)from epersonaldetailtbl where eid =@id)
end
select dbo.fun_YearOfBirth(eid) [Year Of birth],age,eid from epersonaldetailtbl
select * from epersonaldetailtbl
-------------hitarsh
alter function fun_birthyear (@id int) 
returns int 
as begin
return (select(DATEPART(YEAR, Getdate()))-age from epersonaldetailtbl where @id=eid) 
end 
select eid,age,dbo.fun_birthyear(eid) from epersonaldetailtbl
-------b.TABLE VALUED FUNCTION
		---Table Valued Function
		---SYNTAX /*CREATE FUNCTION [schema_name.]function_name (parameter_list) 
					---RETURNS Table 
					---as 
					---SQL-statements
					---RETURN */
--EX1
create function fun_T_emppersonaldetails()
returns Table
as
return(select ename,salary,mgid,eid from EmployeeTable)
--executing
select ename,mgid from dbo.fun_T_emppersonaldetails()
--example 2
alter function fun_T_empdepartment(@id int)
returns Table
as
RETURN (SELECT * FROM tblDepartment WHERE deptID = @ID)
---exe
select * from dbo.fun_T_empdepartment(102)

------------display employee details based on their rating--
--raise error because of same column name EXISTS IN BOTH EMPLOYEETABLE AND TBLPERFORMANCE(eid column)
create function fun_employeerating(@rate float)
returns table
as
return (select * from EmployeeTable e join tblperformance p on e.eid = p.eid where p.rating = @rate)
--no error--
create function fun_employeerating(@rate float)
returns table
as
return (select e.eid,e.ename,p.rating, e.salary from EmployeeTable e join tblperformance p on e.eid = p.eid where p.rating = @rate)
select * from dbo.fun_employeerating (4.5)
------------
--can i call function from stored procdure---YES
---exceptn handling can be used in stored procedure--yes
--can i call  stored procdure from function---NO bcz  stored procedure can use DDL,DML,TCL WHEREAS function uses DQL only
---exceptn handling can be used in functn--NO

--Example: calling function from stored procdure

create proc pro_fun_bonuscalculation
as
begin
	---calling function--
select e.ename,e.salary,e.eid,dbo.fun_bonuscalculation(p.eid),dbo.fun_YearOfBirth(p.eid) 'YearOf Birth' 
from employeetable e join epersonaldetailtbl p on e.eid = p.eid
end
pro_fun_bonuscalculation
---dropping
--drop function functionName

------TRIGGERS----
---Trigger is a statement that a system executes automatically when there is any modification to the database
--syntx
---CREATE TRIGGER trigger_name ON { Table name or view name }
	---[ WITH <Options> ] 
		---{ FOR | AFTER | INSTEAD OF } { [INSERT], [UPDATE] , [DELETE]
	--ex 1
create trigger T_insertsample1
on sample1
for insert
as
begin
print 'You cant do insertion operation'
rollback transaction
end
--check if trigger works
insert into sample1(id,name) values (10,'omkar')
----DROPPING
drop trigger T_insertsample1

---example2 for trigg
alter trigger T_sample
on sample
for insert,delete,update
as
begin
print 'Insertion,deletion,updation cant be done!!!'
rollback transaction
end
--checking
delete from sample
-----
create table tbl_emp_new_desc(eid int references employeetable(eid),description nvarchar(30))
select * from tbl_emp_new_desc
sp_help tbl_emp_new_desc
----dropping constraint--
alter table tbl_emp_new_desc drop constraint FK__tbl_emp_new__eid__02C769E9
------example: when you add newemploy in employeetable then make trigger so that eid and description added in tbl_new_emp_desc
create trigger t_e_new_desc
on employeetable
for insert
as
begin
declare @t_id int
set @t_id = (select eid from inserted)
insert into tbl_emp_new_desc(eid,description) values (@t_id,'New Employee Joined')
end
insert into EmployeeTable(eid,ename,salary) values (110,'prema',66000)
-
select * from tbl_emp_new_desc
select * from EmployeeTable
-----joined date----
------example: when you add newemploy in employeetable then make trigger so that eid and description nd joineddate added in tbl_new_emp_desc

alter table tbl_emp_new_desc add JoinedDate Datetime
--
alter trigger t_e_new_desc
on employeetable
for insert
as
begin
declare @t_id int
set @t_id = (select eid from inserted)
insert into tbl_emp_new_desc(eid,description,joineddate) values (@t_id,'new employee joined',getdate()))
end
insert into EmployeeTable(eid,ename,salary,mgid) values (111,'sanju',49000,103)
--ex:when you delete a employ in employeetable then make trigger so that resignationdate added in tbl_new_emp_desc
alter table tbl_emp_new_desc add ResignationDate Datetime
---
create trigger t_delete_emp
on employeetable
for delete
as 
begin
declare @t_id int
set @t_id = (select eid from deleted)
--delete from tbl_emp_new_desc where eid =@t_id  (before dropping f.k constraint)
update tbl_emp_new_desc set ResignationDate = getdate() where eid = @t_id
end
delete from EmployeeTable where eid = 111
-----
----using INSTEAD OF IN TRIGGER ---
---THE INSERTION OPERATION FOR SAMPLE TABLE NOT HAPPEND BUT DELETION OF RECORD FROM SAMPLE1 TABLE OCCURED
select * from sample1
select * from sample
insert into sample1 values (1,'rani'),(2,'rita'),(3,'sree')
create trigger t_insteadof
on sample
instead of insert
as
begin
declare @name nvarchar(20)
set @name = (select name from inserted)
delete from sample1 where name = @name
end
--exec
insert into sample values ('rani')
----
----example: Leave Table
create table tblemployeeleave
(employeeId int constraint fk_employeeid foreign key references employeetable(eid),
Leavestartdate datetime not null,
Leaveenddate datetime not null,
LeaveReason nvarchar(100),
LeaveType char(2) constraint chkleave check(LeaveType in ('SL','PL','CL')) constraint chkdefaultleave default 'PL',
status nvarchar(20),
LeaveApprovedDate datetime)
select * from tblemployeeleave
insert into tblemployeeleave(employeeId,Leavestartdate,Leaveenddate,LeaveType)
values
(101,'2019-08-01 00:00:00.0','2019-10-12 00:00:00.0','SL'),
(102,'2020-09-28 00:00:00.0','2020-10-01 00:00:00.0','PL')

---when status is approved then fill leaveapproved date
create trigger t_Leave
on tblemployeeLeave
for update
as
begin
declare @t_eid int
declare @t_status varchar(15)
set @t_eid = (select employeeid from inserted)
set @t_status =(select status from inserted)
update tblemployeeleave set Leaveapproveddate = getdate() 
where status = 'approved' and employeeid= @t_eid
end
update tblemployeeleave set status = 'approved' where employeeid = 101

---------COMPOSITE KEY----(TWO COLUMNS AS ONE PRIMARY KEY)

create table tblnewjoining(name nvarchar(10),fathername varchar(10),dob date,YearofPassing varchar(10),
							constraint pk_NameAndFathername primary key(name,fathername))
sp_help tblnewjoining

---giving 'constraint pk_NameAndFathername' in above table is optional --just a name to composite key--
---when making this composite key as foreign key to other table -- then that f.key should have both name and fathername column

-------INTEGRITY CONSTRAINT--

create table book(bid nvarchar(10) constraint pk_bid primary key,bname nvarchar(10))
--auto increment--
---identity(startvalue,increment)---
------identity(increment)---(start is1 by defalt)
create table customer(cid int primary key identity(11,2),cname nvarchar(20))
insert into book(bid,bname) values ('B1','java'),('B2','agile'),('B3','hindi')
insert into customer(cname) values ('rashmi'),('nikhil'),('ameer')
-----reflecting in reader when you delte/update any value in p.k in book or customer) 
create table Reader(bid nvarchar(10) constraint fk_bid references book(bid) on delete cascade on update cascade,
cid int constraint fk_cid references customer(cid) on delete cascade on update cascade,issuedate date)
insert into reader values('B1',13,'2019-05-10'),('B3',15,'2020-10-10')
update book set bid = 'Book1' where bid = 'B1'
select * from book
select * from customer
select * from reader
---------
---DISABLING CONSTRAINT---
--ENABLING AND disabling work only to check and foreign key constraint
--type of constraint
/* primary key,foreign key,not null,check,unique,default,integrity constraint*/

select * from epersonaldetailtbl
sp_help epersonaldetailtbl
---disabling check and f.key
alter table epersonaldetailtbl nocheck constraint all
---epersonaldetailtbl --age have check constr and eid is f.key)
insert into epersonaldetailtbl values(200,1,'nagpur','567918444')
--enabling constraint
alter table epersonaldetailtbl check constraint all
--error
insert into epersonaldetailtbl values(201,12,'nagpur','85567918444')
-----disabling only one constraint
alter table epersonaldetailtbl nocheck constraint CK__epersonalde__age__0E6E26BF
---enabling the constraint
alter table epersonaldetailtbl check constraint CK__epersonalde__age__0E6E26BF
----------------------------------------
----------------------INDEX-------------
----used for fast accessing of data
--------	to identify some info-------
/* A.CLUSTERED index
--deal with range of values eg:600-900
--primary key by default act as clustered index--so only 1 clusteredindex
B.NON CLUSTERED index
--more thaan 1 can be created
--synt: create nonclustered index index_name on table_name(column_name)*/
 create nonclustered index i_location on tbldepartment(location)
 select * from tblDepartment where location = 'Pune'
 ---unique non clustered
 create unique nonclustered index i_dname on tbldepartment(dname)
 ---syntx: drop index tablename.indexname
drop index tbldepartment.i_dname
---renaming index
--syntx: sp_rename 'tablename.indexname','tablename.newindexname','index'
-----------CORRELATED SUBQUERY---
---display employee details column who dont have dept
select * from EmployeeTable where de_id is null
--or
select e.ename,e.de_id from EmployeeTable e where not exists
(select * from tblDepartment d where d.deptid =e.de_id)
--
select e.ename,e.de_id from EmployeeTable e where exists
(select * from tblDepartment d where d.deptid =e.de_id)

---display empdetails whose sal > than avg salary of employee in any dpt
--using subquery
select * from EmployeeTable where salary > 
(select avg(salary) from EmployeeTable) and de_id is not null
--using correlated subquery---results difft --each salary gets compared with avg salary of each dpt here
select * from EmployeeTable e where salary > 
(select avg(salary) from EmployeeTable where de_id =e.de_id)
select * from EmployeeTable
------display the employee details whose salary equal to min salary of employee in their departments
select * from EmployeeTable e where salary = (select min(salary) from employeetable where de_id = e.de_id)
--adding bonus to employ with min salary in each dpt
update employeetable set salary = 
(select eid from EmployeeTable e1 where e1.salary =
(select min(e1.salary) from employeetable e1,employeetable e2 where e1.de_id = e2.de_id))

