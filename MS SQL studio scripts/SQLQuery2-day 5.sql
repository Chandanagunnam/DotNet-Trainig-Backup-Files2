create database coursedatabase
use coursedatabase
create table coursedetails(courseid int ,coursename nvarchar(30), courseFee int,startdate date,enddate date)
select * from coursedetails
alter table coursedetails alter column courseid int not null
alter table coursedetails add primary key(courseid)
sp_help coursedetails
alter table coursedetails drop PK__coursede__2AAB4BC93F080A0D
alter table coursedetails add constraint pk_courseid primary key(courseid)
alter table coursedetails drop column startdate
alter table coursedetails alter column coursefee float
alter table coursedetails add constraint uq unique(coursename)
alter table coursedetails drop uq
alter table coursedetails add constraint uq_coursename unique(coursename)
create table studenttbl(studentid int constraint pk_studentid primary key,studentname nvarchar(25),age int constraint chk_Age check(age >  5))

create table CourseRegistrationTable(studentid int constraint fk_sid references studenttbl(studentid),
courseid int constraint fk_cid references coursedetails(courseid),RegisteredDate Date)
-----------adding default-------------
alter table courseregistrationtable add constraint def_regdate default getdate() for registereddate
-------------------------------------------------------------------------------------------
sp_help coursedetails
sp_help courseregistrationtable

----------------------------------





