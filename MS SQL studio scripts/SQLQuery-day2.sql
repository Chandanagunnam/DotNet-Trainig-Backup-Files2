use dbemployee873
select * from tblDepartment
--aliase names--not reflected in table--but result will appear in aliass
select deptid as DepartmentId,Location [Loc name] from tblDepartment
--where
select deptid as DepartmentId,Location [Loc name],Dname from tblDepartment where Location = 'Airoli'
--top and percnt
select top 3 deptid as DepartmentId,Dname from tblDepartment
select top 20  percent deptid as DepartmentId,Location from tblDepartment
select top 2 * from tblDepartment
select top 50 percent * from tblDepartment
---create employee
create table EmployeeTable(Eid int primary key,Ename nvarchar(30),Salary int)
insert into EmployeeTable(Eid,Ename,Salary) values (101,'Anu',20000),(102,'bunny',30000),(103,'janu',5000),(104,'siri',15000),(105,'alexa',22000),(106,'minnu',45000)
select * from EmployeeTable
sp_rename 'EmployeeTable.Eid','Eid','COLUMN'
select * from EmployeeTable
---salary less than 30k
select Ename,Salary from EmployeeTable where Salary <30000
--salary less than 26k but greater than or equal to 15k
select Ename,Salary from EmployeeTable where Salary <36000 and salary >= 15000
--display deptname whose year of estab b/n 2001-01-01 to 2019-2-12
select dname,YearOfEstablishment from tblDepartment where YearOfEstablishment between '2001-01-01' and '2019-02-12'
select * from tblDepartment
select dname,Location from tblDepartment where Location = 'Thane' or Location = 'Pune'
select dname,Location from tblDepartment where Location in ('Thane','Mumbai','Airoli')
-----below two statements are same
select dname,YearOfEstablishment from tblDepartment where not YearOfEstablishment between '2014-01-01' and '2019-02-12'
select dname,YearOfEstablishment from tblDepartment where YearOfEstablishment not between '2014-01-01' and '2019-02-12'
select dname,Location from tblDepartment where Location !='Thane'
select deptid,dname,Location from tblDepartment where (deptid not in (101,104)) and (deptid between 101 and 105)
--employ details salary less than 25k
select ename [employee name],eid,salary 'salary in rs' from EmployeeTable where Salary <=25000
--- neg operator--not and !
select dname,Location from tblDepartment where Location not in ('Thane','pune')
--below two statements are same
select ename,salary from EmployeeTable where not Salary = 15000
select ename,salary from EmployeeTable where Salary != 15000
----null statements--
---year of esta is null ---
select * from tblDepartment where YearOfEstablishment is null
---year of esta is not null--rest of depts ---
select * from tblDepartment where YearOfEstablishment is not null
select * from tblDepartment where not YearOfEstablishment is null
select * from tblDepartment where YearOfEstablishment is null or YearOfEstablishment = '2015-01-02'
select * from tblDepartment where YearOfEstablishment is null and Location = 'pune'
----arithematic operatns +,-,*,/,%
--bonus addition
update EmployeeTable set salary = salary +5000
---print annual salary 
select Ename, (salary*12) as AnnualSalary from EmployeeTable 
------print annual salary whose salary < 4L
select Ename,salary*12 [AnnualIncome] from EmployeeTable where (salary*12) < 400000
select Ename,salary*12 [AnnualIncome] from EmployeeTable where (salary*12) < 400000
select * from EmployeeTable
alter table EmployeeTable add Annual_Income int
update EmployeeTable set Annual_Income = NULL
select * from EmployeeTable
update EmployeeTable set Annual_Income = Salary*12
select * from EmployeeTable
alter table EmployeeTable drop column Annual_Income

select (salary*10/100) [10% salary] from EmployeeTable
---like operators---(_ and % [],^)
select * from EmployeeTable where ename like '[am]%n_'
select * from EmployeeTable where ename like '%a_%'
select * from EmployeeTable where ename like '[amj]%[^u]'
select * from EmployeeTable where ename like '%[a-f]%'
select * from EmployeeTable where ename like '[aj][^n]%'
--dept name start with s or h
select Dname [department_name] from tblDepartment where dname like '[sh]%'
--location contains i in b/n only
update tblDepartment set location = 'raipur' where deptid = 101
select location from tblDepartment where Location like '%_i%[^i]'
alter table Employeetable drop column gender
---adding gender column and updating values
alter table Employeetable add gender varchar(20)
select * from EmployeeTable
update EmployeeTable set gender = 'Female' where eid=101
update EmployeeTable set gender = 'Male' where eid=102
update EmployeeTable set gender = 'Female' where eid=103
update EmployeeTable set gender = 'Female' where eid=104
update EmployeeTable set gender = 'Female' where eid=105
update EmployeeTable set gender = 'Female' where eid=106
select * from EmployeeTable
---alternate way of updating
update EmployeeTable set gender = 'Female' where eid in (101,103,104,105,106)
update EmployeeTable set gender ='male' where eid not in (101,103,104,105,106)
----adding foreign key to employeetable from tblDepartment----
---same name or difft name as in tbldep--
---same datatype to be used---
alter table employeetable add de_id int references tblDepartment(Deptid)
sp_help employeetable
update EmployeeTable set de_id = 101 where eid in (102,105)
update EmployeeTable set de_id = 103 where eid = 101
update EmployeeTable set de_id = 105 where eid = 103
update EmployeeTable set de_id = 104 where eid = 104
update EmployeeTable set de_id = 102 where eid = 106
select * from EmployeeTable
sp_help tbldepartment
---distinct--to look on unique values
select distinct(location) from tblDepartment
----number functns--
---CEILING,FLOOR,SQUARE---
select CEILING(125.5)
select CEILING(-125.9)
select CEILING(125.5 + 121.1)
SELECT FLOOR(125.5)
declare @a int
set @a = 15
select square(@a)
---area of circle---
declare @radius int = 5
select 3.14*square(@radius) as 'Area of square'
---CHARACTER FUNCTIONS---
select Lower(Dname) as 'Depart Name' from tblDepartment
select Dname,Upper(Dname) as 'Depart Name' from tblDepartment
select Dname,len(Dname) as 'length of Depart Name' from tblDepartment
select Dname,SUBSTRING(Dname,1,5) as 'Depart Name' from tblDepartment
---char index--syntax (charindex(substring,string)(gives position where it is present)
select charindex('hi','hi all')
select location,charindex('ai',location) from tblDepartment
--concat--
select ename,gender,concat(ename,' ',gender) [name and gender] from EmployeeTable
select ename,gender,concat_ws(ename,' ',gender) [name and gender] from EmployeeTable

---date function---
select GETDATE() as date_time
---only date--
select convert(date,getdate()) as only_date
---day/month and year--
select datepart(day,Getdate()) as day,datepart(month,Getdate()) as month,datepart(year,Getdate()) as year
---dateadding--
---add 6 days from todays date--with and W/o time---
select dateadd(day,6,getdate()) as '6days from now with time'
select convert(date,dateadd(day,6,getdate())) as '6days from now with/out time'
----display name ofmonth,weekday and week
select datename(month,getdate()) as 'present month'
select datename(week,getdate()) as 'present week'
select datename(WEEKDAY,getdate()) as 'present weekday'
---difference b/n dates--???
select datediff(day,1997-03-11,2020-03-24) as days
select datediff(day,1997-03-11,2020-03-11) as month
select datediff(year,1997-03-11,2020-01-10) as year
---Global Varibles--@@
select @@SERVICENAME as servicename,@@version as VersionName
----other pre defined fns----
select user_name() [username], db_name() [DataBAse NAme]
-----Agregate functions---(sum,max,min,count,avg)---
select max(salary) [maximum],min(salary) [maximum] from EmployeeTable
----count fn counts all the values(repeated values also)(and exclude null values)
select count(dname) as NoOfDpt from tblDepartment
select count(YearOfEstablishment) as NoOfyearsofestb from tblDepartment
---non numeric values-- max and min works
select max(YearOfEstablishment) as MAxyearsofestb,min(YearOfEstablishment) as Minyearsofestb from tblDepartment
----
select count(distinct(dname)) from tblDepartment
select * from tblDepartment
insert into tblDepartment values (106,'transport','2020-05-11','Airoli')
select count(distinct(location)) from tblDepartment
select distinct(location) from tblDepartment
----aggregate fns not used with where--- 
select * from employeetable where salary > min(salary)
--------aggregate fns  used with having---
select * from employeetable having 







































