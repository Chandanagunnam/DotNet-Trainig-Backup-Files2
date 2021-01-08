---orderby--asc/dsc---syntax: select columnlist from tablename [where condi][order by columnname][asc/dsc]
select * from tblDepartment order by dname asc
----where condition also included--
select * from tblDepartment where dname like '[aeiou]%'order by dname desc
select ename,salary,gender from EmployeeTable order by salary, gender desc

----numbers represents coluns in select list--(2 represents salary column in select list,1 is gender)
select gender,salary from employeetable where salary < 29000 order by 2 desc
--error--(no column 3 in select list)
select gender,salary from employeetable where salary < 29000 order by 3 desc
--no error--
select * from employeetable where salary < 29000 order by 3 desc
--display info column not in select list
select gender,salary from employeetable order by  de_id,ename
---ordering based on expression--
---alias name works in order by only--
select ename,salary,0.5*salary as HalfSalary from employeetable order by Halfsalary desc
select ename,salary,0.5*salary as HalfSalary from employeetable where 0.5*salary > 15000 order by Halfsalary desc
-----
alter table employeetable add mgid int references employeetable(eid)
select * from EmployeeTable
update employeetable set mgid = 103 where eid = 101
update employeetable set mgid = 105 where eid = 102
update employeetable set mgid = 101 where eid = 103
update employeetable set mgid = 104 where eid = 104
update employeetable set mgid = 102 where eid = 105
update employeetable set mgid = 106 where eid = 106
sp_help employeetable
----GROUPBY---
---group by work with aggregate function--
--no. of emp under each manager
select mgid,count(eid) as employcount from EmployeeTable group by mgid order by mgid

groupby -------- SELECT column1,.., columnN FROM table_name WHERE [ conditions ] GROUP BY column1, column2 ORDER BY column1, column2
--taking info from two tables--
select e.ename,e.salary,d.dname from tbldepartment as d,employeetable as e where d.deptid = e.de_id order by d.dname
----print dept name and max salary of each department--
insert into employeetable values (107,'vishnu',81000,'male',104,106)
insert into employeetable values (108,'arjun',62000,'male',102,107)
select * from EmployeeTable
select d.dname,max(e.salary) [Max Salary] from tbldepartment as d,employeetable as e where d.deptid = e.de_id group by d.dname order by [Max Salary]
---no of males and females in dept no.104---
select count(e.gender) [males and females in dept 104] from employeetable as e, tbldepartment as d where (e.de_id = d.deptid) and (d.deptid = 104) group by e.gender
select gender,count(gender)[no. of males and female in dept 104] from EmployeeTable where de_id = 104 group by gender
--- no of females in each department---
select count(e.gender) [females in each department],d.dname from employeetable as e, tbldepartment as d where (e.de_id = d.deptid)  and (e.gender = 'female') group by d.dname
--printt no. of employees in each dept--
select de_id,count(eid) as 'employeenumbers' from EmployeeTable group by de_id
---------print no. of males and female in organization
select count(gender)[no. of males and female] from EmployeeTable group by gender
----------------HAVING----- used  to filter records after grouping or aggregation/filter groups
---------------WHERE-used  to filter records before grouping or aggregation/filter rows
-------Having /*SELECT column1,.., columnN FROM table_name WHERE [ conditions ] GROUP BY column1, column2 having condition ORDER BY column1, column2*/
----------print mgrid having employees >1 and arrange in ODRED
select * from EmployeeTable
select mgid,count(Eid) [no. of employees] from employeetable where mgid != eid group by mgid having count(eid)>=1 ORDER BY MGID
select mgid,count(Eid) [no. of employees] from employeetable group by mgid having count(eid)>=1 order by mgid
----------print mgrid having employees >1 and arrange in OrDRED AND MANAGERID NOT NULL
select mgid,count(Eid) [no. of employees] from employeetable where mgid is not null group by mgid having count(eid)>=1 ORDER BY MGID
-------display de_id,min salary in each depart whose min salry > 29000
select de_id,min(salary) from EmployeeTable group by de_id having min(salary) < 29000 order by de_id
---dislay no. of dpts located in each city---
select * from tblDepartment
select count(deptid)[no. of dpts],Location from tblDepartment group by location 
---display  cities with  more than or equal to 1 dpt and where dptname start with s---
select location,count(deptid) from tblDepartment where dname like '[s]%' group by location having count(deptid)>=1
-------
insert into EmployeeTable values(109,'sagar',42000,'male',104,107)
update employeetable set de_id = 106  where ename = 'sagar'
delete from EmployeeTable where ename ='sagar'
insert into EmployeeTable (eid,ename,salary,gender,mgid) values (109,'sagar',42000,'male',107)
update employeetable set mgid = null  where ename = 'sagar'

--------------joins---------helps to connect one or more tables-----
--inner join--- common columns---
select * from tblDepartment as d inner join EmployeeTable as e on e.de_id = d.deptid
----left join---- or left outer join
select * from tblDepartment as d left outer join EmployeeTable as e on e.de_id = d.deptid
------right outer join--
select * from tblDepartment as d right outer join EmployeeTable as e on e.de_id = d.deptid
--------full join-
select * from tblDepartment as d full join EmployeeTable as e on e.de_id = d.deptid
------conditions and joins------
select e.ename,d.dname from tblDepartment as d inner join EmployeeTable as e on e.de_id = d.deptid where e.ename like '[a-f]%' order by e.ename
--------- max salary for y.o.est b/n 2005 and 2020 and its dept---
select e.ename,d.yearofestablishment,max(e.salary) from tblDepartment as d inner join EmployeeTable as e on e.de_id = d.deptid
where 
-------self join-----
----------display the employee name and manager name of each employee-----
select e.ename [employee name],m.ename [manager name]  from EmployeeTable [e] inner join employeetable [m]
on e.mgid = m.eid
select * from EmployeeTable
update employeetable set mgid = 108  where ename = 'sagar'
update employeetable set mgid = null  where ename = 'siri'
----------name of emplo with no manager---
select e.ename,m.ename from employeetable e left join employeetable m on e.mgid = m.eid where e.mgid is null
-------display manager name and no. of employes whose manager is not null and having more than 1 employee---(((((((((
select m.ename 'manager name',count(e.ename) 'no. of employ' from EmployeeTable e left join EmployeeTable m on e.mgid = m.eid
where e.mgid is not null group by m.ename having count(e.ename)>1

select m.Ename 'Managername', count(e.ename) 'Employee number' from EmployeeTable e left join EmployeeTable m on e.Mgid=m.eid 
where e.mgid is not null group by m.Ename having count(e.Ename)>2

--------cross join--comparison of two tables
select * from tblDepartment as d cross join EmployeeTable 
-----------------
------craete table with emplo personal detaisl---
drop table epersonaldetailtbl
create table epersonaldetailtbl(eid int constraint fk_eid references employeetable(eid),
age int check(age>18),city nvarchar(30) default 'Hyderabad',phone nvarchar(25) unique)
 
insert into epersonaldetailtbl(eid,age,city,phone) values (101,21,'noida',9126735),(103,28,'vizag',235647),(104,31,'kurnool',5647789),
(105,24,'mysore',34567),(106,34,'tirupati',6971),(107,52,'mysore',753199),(102,23,'kolkata',456258)
insert into epersonaldetailtbl(eid,age,phone) values (106,41,2347895)
insert into epersonaldetailtbl(eid,age,city) values (108,46,'nagpur')
select * from epersonaldetailtbl
---------views--==== abstractions
-----create view viewname as select column1,column2,....column n from tablename----

create view v_empdetails as select ename,salary from EmployeeTable
select * from v_empdetails
------alter the view----
alter view v_empdetails as select e.ename,p.age,e.gender from 
employeetable e inner join epersonaldetailtbl p on e.eid =p.eid where age <35
--order by------ not used in views---error
alter view v_empdetails as select e.ename,p.age,e.gender from 
employeetable e inner join epersonaldetailtbl p on e.eid =p.eid where age <35 order by e.ename
--------groupby in a view ----
create view v_msalary as
select max(e.salary) [max salary],d.dname from tblDepartment d, EmployeeTable e 
where d.deptid =e.de_id group by d.dname having max(e.salary) > 25000
select * from v_msalary
------------------view with and w/o check option----
create view v_agecheck as select age,eid from epersonaldetailtbl where age > 27
--if we insert into v_agecheck values then original (epersonaldetailtbl) table will be affected and changed)---
--inser into v_agecheck values
-------------------------with check option--
alter view v_agecheck 
as
select age,eid  from epersonaldetailtbl where age > 27  with check option                                      
insert into v_agecheck values(25,110)--------error

---best practice for view is use dql command---

---better not 'update'-------
---joining 3 tables----
select e.ename,p.age,d.dname,d.yearofestablishment from employeetable e inner join epersonaldetailtbl p on e.eid = p.eid
inner join tblDepartment d on e.de_id = d.deptid order by d.dname desc
-------sub Queries-----
-----select/delete/update/insert column names from table1,[,table2] where col_name operator (select column_name from table1,[,table2](([where]))----
----single roow subqueries-
---display name ,salary of employ whose salary is greater than that of empid with 105
select ename,salary from EmployeeTable where salary > (select salary from employeetable where eid =105)
-----delete employee details whose departame is finance---error ????
delete from employeetable where de_id =  (select deptid from tblDepartment where dname = 'finance')
---display the deptidd,avg salary of all dpts,whose avg salary > than avg salary of dept 101
select de_id,avg(salary) from employeetable group by de_id having
avg(salary) > (select avg(salary) from employeetable where de_id = 101)
-------------multi row subqueires--------keywords: in,any and all-------(order by not used in subqueries)
-------in---
--display the name, salaries of one of the employee in dept 102
select de_id ename,salary from employeetable where salary in (select salary from EmployeeTable where de_id = 102)
-------all-------display the name, salaries of the employee greater than other employee in dept 102
select de_id,ename,salary from employeetable where salary > all (select salary from EmployeeTable where de_id = 102)
-----------any-------display the name, salaries of the employee greater than other employee in dept 102
select de_id,ename,salary from employeetable where salary > any (select salary from EmployeeTable where de_id = 102)
---------display the name, salaries of the employee greater than other employee in dept 102(except 102)
select de_id,ename,salary from employeetable where salary > any 
(select salary from EmployeeTable where de_id = 102) and de_id != 102
---------display the name, salaries of the employee greater than employee in dept 102(and dpt name < tahn 105)
select de_id,ename,salary from employeetable where salary > all (select salary from employeetable where de_id =105) and de_id < 105
----------display emp details whose mobile no. is  6971
select * from epersonaldetailtbl where phone = '6971'
select e.ename,p.phone from EmployeeTable e, epersonaldetailtbl p where e.eid = p.eid and p.phone = '6971'
---using subqurey)
select * from EmployeeTable where eid =( select eid from epersonaldetailtbl where phone ='6971')
-----TRANSACTION CONTROL LANGUAGE---
select * from TestEntity
sp_rename 'testentity.id', 'testid','column'
insert into testentity(testid,testname) values (1,'java'),(2,'python'),(3,'clang'),(4,'oracle')
-----save transaction--- we can undo a saved transaction(s2) by rolling back to previous saved transaction(s1)
-----dont use same transaction name to save---
begin transaction
insert into TestEntity values (7,'geology')
save transaction s1
insert into testentity values (8,'production')
save transaction s2
select * from TestEntity
rollback transaction s1

select * from TestEntity
select * from sample1
------------commit----(commit transactns cannot be reverted/rolled back)---rollback does not work after commit
begin transaction t1
insert into sample1(id,name) values (1,'chandana'),(2,'sheela'),(3,'madhu')
select * from sample1
commit
rollback transaction
----------T-SQL Programming /*BEGIN DECLARATION VARIABLE T-SQL statement*/----------
begin
declare @num1 int = 30
declare @num2 int ,@result int
set @num2 =50
set @result =@num1 +@num2
print @result
end
----if else-----
declare @var1 int = 70, @var2 int = 90
begin
if (@var1 > @var2)
begin 
print 'variable1 is greater'
end
else
begin
print 'variable2 is greater'
end
end
------CASE STATEMENT---/*CASE <Case_Expression> WHEN Value_1 THEN Statement_1 WHEN Value_2 THEN Statement_2 
----------------------------------...... WHEN Value_N THEN Statement_N [ELSE Statement_Else] END AS [ALIAS_NAME]
---CASE Used with order by,where,...
--updating female and male---
UPDATE EmployeeTable set gender = 'f' where gender ='female'
UPDATE EmployeeTable set gender = 'm' where gender ='male'
------updating female and male- in one statement using CASE--
UPDATE EmployeeTable set gender = case gender
when 'female' then 'f'
when 'male' then 'm'
else 'not entered'
end
select * from employeetable
UPDATE EmployeeTable set gender =
case 
when eid in (101,103,104,105) then 'f' 
else
'm'
end

-----------create tblperformance---
create table tblperformance(eid int references employeetable(eid),rating float(2))
insert into tblperformance(eid,rating) values (101,5),(102,4.2),(103,2.7),(104,3.9),(105,4.5)
-------CASE AND when with multiple condition---
select eid ,
CASE
when rating = 5 then 'excellent'
when rating <=4.9 and rating >=4 then 'good'
when rating <=3.9 and rating >=3 then 'average'
else 'poor'
end as 'rating performance'
from tblperformance
-------------------note from notes---
select ename,gender,salary from employeetable order by CASE gender when 'F' Then salary end desc,
case when gender = 'm' then salary end

---case in delete condition----(???)

----while--
declare @count int = 1
while @count <= 5
begin 
print @count
set @count = @count +1
end
------while continue break---
---print numbers from 1 to 6 except 5 in a set of 10 numbers
declare @count1 int = 0
while @count1 <=10
begin
set @count1 = @count1 + 1
if @count1 = 5
continue
if @count1 =7
break
print @count1
end
---print numbers from 1 upto 6 in a set of 10 numbers
declare @count1 int = 0
while @count1 <=10
begin
set @count1 = @count1 + 1
if @count1 =7
break
print @count1
end
------work on this--
declare @count2 int =0
while @count2 <= 100
begin
if (@count2)%6 = 0
print @count2
set @count2 = @count2 +1 
end
-------
-------STORED PROCEDURES-----
--/*Create procedure <procedure_Name> As Begin <SQL Statement> DDL,DML,DQL,TQL End Go/
----stored procedures without parameter---
CREATE procedure pro_welcome
as
begin
select 'hello'
end
--execute --two ways
exec pro_welcome
pro_welcome
---example
create procedure proc_callemp
as 
begin
select * from EmployeeTable
end
proc_callemp
--------store procedure with parameter---
--ex1
create proc proc_empdetails(@id int)
as
begin
select * from EmployeeTable where eid = @id
end
proc_empdetails @id = 105
proc_empdetails 103
---ex2--
create procedure proc_employdetailsbyage(@age int)
as
begin
select e.ename,p.age,d.dname,d.yearofestablishment from employeetable e inner join epersonaldetailtbl p on e.eid = p.eid
inner join tblDepartment d on e.de_id = d.deptid where age> @age order by d.dname desc
end
proc_employdetailsbyage 50

---ex3
create procedure proc_insertperformance(@id int,@r float)
as
begin
insert into tblperformance(eid,rating) values (@id,@r)
end

proc_insertperformance 107,2.5
proc_insertperformance @r = 4.5, @id = 106
select * from tblperformance
--------calculate tax---
----------input:eid,output:tax
create procedure proc_taxcalculation(@id int)
as
begin
declare @AnnualSal int,@taxamount float
set @AnnualSal = (select (salary*12) from employeetable where eid = @id)
	if (@AnnualSal > 500000)
	begin
	set @taxamount = @AnnualSal *0.1
		print @taxamount
	end
	else
	begin
	set @taxamount = 0
	print @taxamount
	end
	end
proc_taxcalculation 101
---eg--
alter procedure proc_taxcalculation(@id int)
as
begin
declare @AnnualSal int,@taxamount float
set @AnnualSal = (select (salary*12) from employeetable where eid = @id)
	if (@AnnualSal > 500000)
	begin
	set @taxamount = @AnnualSal *0.1
	print cast(@id as nvarchar) + 'pays' + cast(@taxamount as nvarchar)+ 'as tax amount'
	end
	else
	begin
	set @taxamount = 0
	print cast(@id as nvarchar) 'pays' + cast(@taxamount as nvarchar)+ 'as tax amount'
	end
	end
proc_taxcalculation 105
----------------h/w----taxcalculation for above question using CASE statement ??/------(10% of annualsalary if ann.sal > 5L)
alter procedure proc_taxcalculation(@id int)
as
BEGIN 
declare @annualsalary int, @taxamount float
SET @annualsalary = (select (salary*12) from EmployeeTable where eid = @id)
set @taxamount = 
case
when @annualsalary > 500000
then (0.1* @annualsalary)
else
(0* @annualsalary)
end 
print cast(@taxamount as nvarchar)+ 'is payable by' + cast(@id as nvarchar)
END
EXEC proc_taxcalculation 103
EXEC proc_taxcalculation 107
select * from EmployeeTable

	-------------------------
	-----store procedure with return---
	--sp stores int only

	create procedure proc_maxsalary
	as
	begin
	return(select max(salary) from employeetable)
	end

	declare @msalary int
	exec @msalary = proc_maxsalary
	print @msalary
	----sp cant return other datatype apart from int--(error when execute 	proc_deptname)
	create procedure proc_deptname
	as
	begin
	return (select dname from tblDepartment where deptid =101)
	end
	exec proc_deptname

	-----------stored procedure with out parameter
	---cant store set of value in single out parameter
create proc proc_minsalary(@dname varchar(20) output,@did int)
as
begin
set @dname =(select dname from tbldepartment where deptid =@did)
end

declare @dptname nvarchar(20)
exec proc_minsalary @dptname output,@did = 105
if(@dptname is null)
print 'department name not exist'
else 
print @dptname

--------------EXCEPTION HANDLING-------
---error function
---error_number(),error_line(),error_severity(),error_state(),error_procedure,error_message
begin try
declare @a int = 10,@div int
set @div=@a/0
end try
begin catch
select error_number(),error_line(),error_severity(),error_state(),error_procedure(),error_message()
end catch
--exmple
begin try
delete from tblDepartment where deptid = 101
end try
begin catch
select ERROR_MESSAGE() 
end catch
-----------handling errors in stored procedure---
alter proc proc_deletedept(@did int)
as
begin
begin try
delete from tblDepartment where deptid = 101
end try
begin catch
---select ERROR_MESSAGE() 
--print 'u cant delte dpt details'
--raiserror('u dont have access',16,1)
--declare @error= error_Severity()
---raiserror(@error)
throw
end catch
end
proc_deletedept 105
------to drop--
--drop procedure procedure name
drop procedure proc_callemp

begin try
declare @result int = 55/0
end try
begin catch
throw;
print 'after throw'
end catch
print 'after catch'

---can we call stored procedure from other stored procedure
create proc proc_welcome
as
begin
select 'hello'
end
proc_welcome
----------
alter proc proc_calling
as
begin
exec proc_welcome
end
exec proc_calling
---------------
create proc proc_callinser_join(@id int,@r float,@age int)
as
begin
exec proc_insertperformance @id = 105, @r =2.5
exec proc_employdetailsbyage @age = 30
end
exec proc_callinser_join @id = 102, @r =2.5, @age = 10

-----transaction in stored procedure--
create proc proc_trans
as
begin
begin transaction
insert into tbldepartment(deptid,dname,YearOfEstablishment,location)
values(16,'sports','2015-02-11','patna')
select * from tblDepartment
insert into tbldepartment(deptid,dname,YearOfEstablishment,location)
values(16,'biology','1995-02-11','mizoram')
insert into tbldepartment(deptid,dname,YearOfEstablishment,location)
values(26,'science','2008-02-11','manipal')
if(@@error > 0)
	begin
	rollback transaction
	end
else
begin
commit transaction
end
end
proc_trans