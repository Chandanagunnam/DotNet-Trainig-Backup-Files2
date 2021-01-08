create database dbmovie
use dbmovie
create table tblmovie(movieid int constraint pk_mid primary key,moviename nvarchar(50) unique,
YearOfMovie date,releasedate date)
--changing datatype of release date
alter table tblmovie alter column releasedate datetime
--create theatre table
create table tbltheatre(theatreId int,TheatreName varchar(20),City varchar(20))
--add pk to th.id
alter table tbltheatre alter column theatreid int not null
alter table tbltheatre add constraint pk_tid primary key(theatreid)
--create tblmovietheatre
create table tblmovietheatre(movieid int constraint fk_mid references tblmovie(movieid),
theatreid int constraint fk_tid references tbltheatre(theatreid),ticketprice float)
--renaming tblmovietheatre to tblmovietheatrestatus
sp_rename 'tblmovietheatre','tblmovietheatrestatus'
----ticketprice not negative--add check constraint
alter table tblmovietheatre add constraint chk_tprice check(ticketprice > 0)
----insert imto movietable
insert into tblmovie(movieid,moviename,YearOfmovie,releasedate) values
(1001,'Bahubali','2015-01-01','2015-05-17 10:30:40.5'),
(1002,'Dangal','2017-01-01','2017-06-12 09:20:40.2'),
(1003,'Spyder','2018-01-01','2018-09-13 14:12:52.9'),
(1004,'Dhoom','2019-01-01','2019-07-12 16:13:42.5')
insert into tblmovie values (1005,'Sholay','1974','1974-05-10')
insert into tblmovie values (1006,'Singam','2018','2018-12-10')
select * from tblmovie
------auto increment-----
create table sample (id int constraint pk_id primary key identity(1,2))
--default is 1 for startvalue and increment if values are not given in identity
alter table sample add samplename nvarchar(20)
-------display moviename released b/n 2017 nd 2018
select moviename from tblmovie where releasedate between '2017-01-01' and '2018-12-31'
------
select moviename from tblmovie where releasedate between '2017' and '2019'
---display moviedetails start with s or d; end with m
select * from tblmovie where moviename like '[sd]%m'
---arrange moviename in desc ordeer
select moviename,YearOfMovie,releasedate  from tblmovie order by moviename desc
------arrange moviename in desc ordeer,yearof movie in asc
select moviename,YearOfMovie,releasedate  from tblmovie order by YearOfMovie asc,moviename desc
---insert records in theatre table---
insert into tbltheatre(theatreId,TheatreName,City) values
(101,'PVR Cinemas','Mumbai'),(102,'AMB Movies','Chennai'),(103,'Prasads Multiplex','Hyderabad'),
(104,'Laxmi Talkies','Pune'),(105,'CineMax','Patna'),(106,'Devi multiplex','Kakinada')

--------insert records in movietheatre status table---
insert into tblmovietheatrestatus(movieid,theatreid,ticketprice) values
(1001,103,150),(1001,104,200),(1002,101,100),(1002,105,110),(1006,102,90),(1004,106,120)
update tblmovietheatrestatus set ticketprice = 120 where theatreid = 102
select * from tblmovietheatrestatus

-------display moviename,theatre id nd price for all movies in theatres
select m.moviename,mts.theatreid,mts.ticketprice from 
tblmovie m,tblmovietheatrestatus mts where m.movieid = mts.movieid

------display moviename,theatre name nd price for all movies in theatres--
select m.moviename,t.theatrename,mts.ticketprice from 
tblmovie m,tbltheatre t,tblmovietheatrestatus mts 
where m.movieid = mts.movieid and t.theatreId =mts.theatreid

--(using joins)display moviename,theatre name nd price for all movies in theatres-
select m.moviename,t.theatrename,mts.ticketprice from 
tblmovie m inner join tblmovietheatrestatus mts on m.movieid = mts.movieid
inner join tbltheatre t on t.theatreId =mts.theatreid

----display the movies having movie price > than 110
select m.moviename,mts.ticketprice from
tblmovie m inner join tblmovietheatrestatus mts on m.movieid = mts.movieid where mts.ticketprice > 110
--or--
select m.moviename,mts.ticketprice from
tblmovie m,tblmovietheatrestatus mts where m.movieid = mts.movieid and mts.ticketprice > 110 

---display the number of movies having movie price > than 250
select count(movieid) 'No. of movies' from tblmovietheatrestatus where ticketprice > 110
-----------
---------------------GROUP BY------------//Look again
---display movieid and no. of theatre name where a particular movie is running
select movieid,count(theatreid) 'number of theatres' from tblmovietheatrestatus group by movieid

-------display moviename and no. of theatre name where movies are running
select m.moviename,count(mts.theatreid) 'no. of thaetres' from 
tblmovietheatrestatus mts,tblmovie m where mts.movieid = m.movieid group by m.moviename

-------display moviename and no. of theatre name where movies are running no.theatres > 1///Look again

select m.moviename,count(mts.theatreid) 'no. of theatres > 1' from 
tblmovietheatrestatus mts,tblmovie m where mts.movieid = m.movieid group by m.moviename 
having count(mts.theatreid) > 1

-----Display the cities in which we have theatre
----(no repeat of cityname if we have two theatres in same cities)
insert into tbltheatre values (107,'Radhika Theatre','Pune')
select distinct(city) from tbltheatre

--------using dbemployee873
----display second highest salary of employee
use dbemployee873
select * from EmployeeTable
select  max(salary) 'second highest' from employeetable where salary <
(select max(salary) from employeetable) 
----display third highest salary of employee 
select  max(salary) '3rd high' from employeetable where salary <
(select  max(salary)  from employeetable where salary <
(select max(salary) from employeetable))
------------
--storeprocedure for inserting values into theatretable
alter proc proc_InsertTheatreValues(@tid int,@tname varchar(20),@city varchar(20))
as
begin
insert into tbltheatre(theatreid,theatrename,city) values (@tid,@tname,@city)
end
exec proc_insertTheatreValues @tid =108,@tname ='Ram Imax',@city = 'Hyderabad'
exec proc_insertTheatreValues @tid =102,@tname ='OrbitMall Imax',@city = 'Vizag'

------
---disabling constraint---
alter table tblmovietheatrestatus nocheck constraint all
delete from tbltheatre where theatreid = 102
---enabling constraint
alter table tblmovietheatrestatus check constraint all
delete from tbltheatre where theatreid = 101
insert into tblmovietheatrestatus(movieid,theatreid,ticketprice) values(1005,101,140),(1006,102,210)
select * from tbltheatre
---------------
create proc proc