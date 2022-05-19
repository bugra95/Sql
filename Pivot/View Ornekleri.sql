-- Bir siparisin hangi calisan tarafindan, hangi musteriye, hangi kategorideki urunden, hangi fiyattan, kac adet satildigini listeleyiniz. Bunun icin calisanin adi, soyadi, unvani, gorevi, ise baslama tarihi; musterinin firma adi, temsilcisi ve telefonu; urunun adi, stok miktari, birim fiyati; siparisin adedi ve satis fiyati; kategori adi sutunlarini kullaniniz...
select  
	e.FirstName, e.LastName, e.TitleOfCourtesy, e.Title, e.HireDate,
	c.CompanyName, c.ContactName, c.Phone,
	p.ProductName, p.UnitsInStock, p.UnitPrice,
	od.Quantity, od.UnitPrice,
	ct.CategoryName
from Employees as e
join Orders as o on e.EmployeeID = e.EmployeeID
join Customers as c on c.CustomerID = o.CustomerID
join [Order Details] as od on od.OrderID = o.OrderID
join Products as p on od.ProductID = p.ProductID
join Categories as ct on ct.CategoryID = p.CategoryID

-- Bu sorgu icin bir view olusturalim:
create view SatisRaporlari as
select  
	e.FirstName, e.LastName, e.TitleOfCourtesy, e.Title, e.HireDate,
	c.CompanyName, c.ContactName, c.Phone,
	p.ProductName, p.UnitsInStock, p.UnitPrice,
	od.Quantity,
	ct.CategoryName
from Employees as e
join Orders as o on e.EmployeeID = e.EmployeeID
join Customers as c on c.CustomerID = o.CustomerID
join [Order Details] as od on od.OrderID = o.OrderID
join Products as p on od.ProductID = p.ProductID
join Categories as ct on ct.CategoryID = p.CategoryID

-- Olusturdugumuz view'i cagiralim:
select * from SatisRaporlari

-- Bir view olusturduktan sonra, normal tablolar gibi istedigimiz kolonlari cekebiliriz:
select FirstName, LastName, CategoryName from SatisRaporlari

-- Categories tablosunun CategoryName ve Description sutunlarindan olusan ve ismi Kategoriler olan bir view olusturunuz...
create view Kategoriler as select CategoryName, Description from Categories

insert into Kategoriler values ('Mercedes', 'Bir dunya markasi')

select * from Kategoriler
select * from Categories

-- Kategoriler isimli View'a CategoryID sutunu ekleyelim...
alter view Kategoriler as
select CategoryID as [No], CategoryName, [Description] from Categories

select * from Kategoriler

-- Kategoriler isimli View'i silelim:
drop view Kategoriler