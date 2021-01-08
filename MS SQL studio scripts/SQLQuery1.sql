create database dbStudent
use dbStudent
create table StudentDetails(StudentID int primary key, StudentName nvarchar(20), DOB nvarchar(15))


insert into StudentDetails values (101, 'Chandana', '11/03/1997'),(102,'Anuja','12/07/2005'),(103,'Radha','31/05/1995'),(104, 'Rajesh','12/05/1990')

create table Course (CourseId int primary key, CourseName nvarchar(30), Duration int, Fees int)
insert into Course values (1001,'Java',05,9500),(1002,'Csharp',06,9200),(1003,'SQL',02,5000),(1004,'Angular',09,95000)
select * from Course
select * from StudentDetails
create table Enroll(StudentId int references StudentDetails(StudentId) on delete cascade on update cascade, CourseId int references
Course(CourseId) on delete cascade on update cascade, DateofEnroll date)
alter table Enroll alter column DateofEnroll nvarchar(15)
create procedure StudentRegistration (@id int, @name nvarchar(20),@dob nvarchar(20))
as
begin
insert into StudentDetails values(@id,@name, @dob)
end
//exec StudentRegistration @id=101,@name='Shanti', @dob='18/02/1978'

create Procedure AddCourse(@id int, @name nvarchar(20), @duration int, @fees int)
as
begin
insert into Course values(@id,@name,@duration,@fees)
end
create procedure Enrollment (@sid int, @cid int,@date nvarchar(20))
as
begin
insert into Enroll values(@sid, @cid, @date)
end
exec Enrollment @sid = 101,@cid= 1002, @date='15/05/2016'
exec Enrollment @sid = 102,@cid= 1001, @date='16/05/2016'
exec Enrollment @sid = 103,@cid= 1002, @date='17/05/2016'
exec Enrollment @sid = 104,@cid= 1003, @date='18/05/2016'
exec Enrollment @sid = 104,@cid= 1003, @date='18/05/2016'
select * from Enroll