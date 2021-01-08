-----Display the fullname of the employee
select concat(firstname,' ',lastname) [full name of employee] from Employees
------Display the customer details who has Fax number
select * from Customers where fax is not null
select * from Customers where fax is null
-------display the customer details whose name holds second letter as U
select * from customers where ContactName like '__[u]%'
----- select order Details where unit price is greater than 10 and less than 20
select * from [Order Details] where UnitPrice > 10 and unitprice < 20
---Display order details which contains shipping date and arrange the order by date
select * from Orders where ShippedDate is not null order by shippedDate
-----Print the orders shipped by ship name 'La corne d'abondance' between 2 dates(Choose dates of your choice)
select * from Orders where (shipname = 'La corne d''abondance' ) and (ShippedDate between '1990-02-01' and '2005-03-01')
----Print the products supplied by 'Exotic Liquids'
select productname [products supplied Exotic Liquids] from suppliers inner join Products
on suppliers.SupplierID = products.SupplierID where suppliers.companyname = 'Exotic Liquids'
--------- print the average quantity ordered for every product
select avg([Order Details].Quantity)[average quantity ordered for every product],Products.ProductName 
from [Order Details],products
where products.ProductID = [Order Details].ProductID group by products.ProductName 
-----
select [Order Details].Quantity,Products.ProductName from [Order Details] inner join Products on products.ProductID = [Order Details].ProductID order by products.ProductName
---------Print all the Shipping company name and the ship names if they are operational---(?)
 select shipname,companyname from orders o join shippers s on o.shipvia = s.ShipperID where shipregion is not null
 --------Print all Employees with Manager Name--
sp_help employees
select * from employees
select (e.FirstName+' '+ e.lastname) [employee name],(m.firstname + ' ' + m.lastname)[manager name] from Employees e left join employees m 
on e.ReportsTo = m.EmployeeID where e.ReportsTo is not null
--------
select e.FirstName [employee name],m.firstname [manager name] from Employees e left join employees m 
on e.ReportsTo = m.EmployeeID 
-----Print the bill for a given order id .bill should contain Productname, Categoryname,price after discount-----
select ((od.unitprice*od.quantity)*(1-od.discount)) [bill], p.productname,c.categoryname 
from [Order Details] od inner join Products p on od.ProductID=p.ProductID inner join Categories c on c.CategoryID=p.CategoryID 
where od.orderid = 10251
----------
select p.productname, c.categoryname, o.UnitPrice*o.Quantity*(1-o.Discount) as 'price after discount' from
[Order Details] as o inner join products as p on o.productid=p.productid 
inner join Categories as c on p.CategoryID = c.CategoryID where o.OrderID = 10251

--------
-----------question 12 Print the Total price of orders which have the products supplied by 'Exotic Liquids'---
------------------if the price is > 50 and also print it by Shipping company's Name---
sp_help orders
select * from orders
select * from shippers
------------questin 12:Print the Total price of orders which have the products supplied by 'Exotic Liquids'
									-----if the price is > 50 and also print it by Shipping company's Name
select odt.UnitPrice*odt.quantity - odt.discount * (odt.unitprice*odt.quantity) [total price],s.companyname [company name] from
shippers s inner join orders o on s.shipperid = o.shipvia
inner join [Order Details] odt on o.orderid =odt.orderid
inner join products pd on pd.productid = odt.productid
inner join suppliers sp on pd.supplierid = sp.SupplierID
where sp.CompanyName = 'Exotic Liquids' and odt.unitprice * odt.quantity- odt.discount *(odt.unitprice*odt.Quantity)>50

-------DAY 4 ASSIGNMENT-----
select * from Customers
select * from 
customers as c join Orders as o on o.CustomerID = c.CustomerID
join [Order Details] as od on od.OrderID =o.OrderID order by c.Contactname
--------------------------------------
-----1. Write a procedure that determines the customer who has placed the maximum number of orders

alter proc proc_maxorderbycustomer
as
begin
select top 1 sum((od.quantity)) as [Max orders based on quantity] ,C.contactname from 
customers as c join Orders as o on o.CustomerID = c.CustomerID
join [Order Details] as od on od.OrderID =o.OrderID 
group by c.Contactname
order by [Max orders based on quantity] desc
end
proc_maxorderbycustomer
----------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-----2. Write a procedure to display the list of products that are out of stock

create proc proc_OutOfStockProducts
as
begin
select productname,UnitsInStock from Products where UnitsInStock is null or UnitsInStock = 0
end
proc_OutOfStockProducts
-------------------------------------------------------------------------------------------
select * from Products
---------------------------------------

-----3.	Write a procedure to delete any product with error handling mechanism

alter proc proc_DeleteProduct(@PID int)
as
begin
begin try
delete from products where Productid = @PID
end try
begin catch
select error_message() [Message],error_severity() [Severity],error_line() [Line Number],error_number() [Error Number]
---print 'you cannot delete'
end catch
end
proc_deleteproduct @PID = 10
