-- create database
create database dbemployee873
-- using database
use dbemployee873
--creating table
create table tblDepartment(deptid int,Dname varchar(30),Location nvarchar(30))
--structure of table
sp_help tblDepartment
--adding new column to department table
alter table tblDepartment add YearOfEstablishment date
--altering dname varchar(30 to varchar(50))
alter table tbldepartment alter column Dname varchar(50)
--deleting a particular column from table
alter table tbldepartment drop column Location
select * from tblDepartment
--adding primary key
alter table tblDepartment add Primary key (deptid)
--error,first change deptid to not null and then add prim.key
alter table tblDepartment alter column deptid int not null
alter table tblDepartment add Primary key (deptid)
--create sample
create table sample (id int constraint pk_id primary key,name nvarchar(20))
sp_help sample
--dropping id /but error
alter table sample drop column id
--first drop constraint and then id(costraint is name to prim.key given by us)
alter table sample drop constraint pk_id
alter table sample drop column id
create table sample1 (id int constraint pk_id primary key,name nvarchar(20))
sp_help sample1
--test table
create table test (id int primary key)
alter table test drop PK__test__3213E83F42F1BD9C
--renaming table name
alter table test add  tname varchar(20)
sp_rename 'test','TestEntity'
--renaming column name
sp_rename 'TestEntity.tname','testname','COLUMN'
sp_help TestEntity
---------DATA MANIPULATION LANGUAGE--------INSERT,DELETE,UPDATE
alter table tblDepartment add Location nvarchar(30)
sp_help tblDepartment
insert into tblDepartment values(101,'HR','2020-02-01','Thane')
--not giving year of estab
insert into tblDepartment(deptid,Dname,Location) values(102,'Development','pune')
---multiple insertions
insert into tblDepartment(deptid,Dname,YearOfEstablishment,Location) values(103,'Sales','2012-05-02','Airoli'),(104,'admin','2015-06-12','Mumbai')
---inserting null values external
insert into tblDepartment(deptid,Dname,YearOfEstablishment,Location) values(105,'Finance',null,'Chennai')
---giving same value to deptid(prim.key)--error
insert into tblDepartment(deptid,Dname,YearOfEstablishment,Location) values(105,'production','1989-02-01','banglore')
------giving same value to other attributes--no error
insert into tblDepartment(deptid,Dname,YearOfEstablishment,Location) values(106,'production','1997-11-11','Airoli')
select * from tblDepartment
---DELETE AND UPDATION
sp_help sample
insert into sample values('Tom'),('sam'),('ram')
delete from sample
select * from sample
--delte particular record
delete from tblDepartment where deptid=106
select * from tblDepartment
--update for one record
update tblDepartment set YearOfEstablishment = '2015-01-02' where Dname ='HR'
select * from tblDepartment
--update for all locations
-- update tblDepartment set YearOfEstablishment = '2015-01-02'--(date changes for allthe five records)








