-- 1. INNER JOIN: Bir tablodaki her bir kaydin diger tabloda bir karsiligi olan kayitlari listelenir. Bir baska deyisle, veritabanindaki tablolari ortak verilerle esi olmayan kolonlardan birlestirme isi yapar. Inner join islemi yaparken inner ifadesini yazmasak da olur. Sadece join ifadesi yazmak yeterli olur.

-- Products tablosunun ProductName sutunu ile Categories tablosunun CategoryName sutununu birlestirelim. Bu islemi yaparken iki tabloda da ortak ve essiz olan CategoryID'lerden faydalanmamiz gerekiyor:
select ProductName, CategoryName from Products join Categories on Products.CategoryID = Categories.CategoryID

-- Products tablosundan ProductID, ProductName, CategoryID ve Categories tablosundan CategoryName, Description sutunlarini birlestiriniz...
select ProductID, ProductName, p.CategoryID, CategoryName, Description from Products as p
join Categories as c on p.CategoryID = c.CategoryID

-- Customers, Orders ve Employees tablolarindan OrderID, OrderDate, CompanyName, ContactName, FirstName, LastName ve Title sutunlarini birlestiriniz. (Hangi siparis, hangi calisan tarafindan, hangi musteriye yapilmis)...
select OrderID, OrderDate, CompanyName, ContactName, FirstName, LastName, Title from Customers as c
join Orders as o on c.CustomerID = o.CustomerID
join Employees as e on e.EmployeeID = o.EmployeeID

-- Suppliers tablosundan CompanyName, ContactName; Products tablosundan ProductName, UnitPrice; Categories tablosundan CategoryName sutunlarini birlestiriniz. CompanyName sutununa gore artan sirada listeleyiniz...
select CompanyName, ContactName, ProductName, UnitPrice, CategoryName from Suppliers
join Products on Suppliers.SupplierID = Products.SupplierID
join Categories on Products.CategoryID = Categories.CategoryID
order by CompanyName

-- Kategorilere gore toplam stok miktarini bulunuz ve azalan sirada listeleyiniz...
select CategoryName, SUM(UnitsInStock) as ToplamStokMiktari from Categories c
join Products p on c.CategoryID = p.CategoryID
group by CategoryName order by ToplamStokMiktari desc

-- Her bir calisan toplam ne kadarlik satis yapmistir?
select  
	FirstName + ' ' + LastName as Isim,
	(CAST(CAST(SUM(UnitPrice * Quantity * (1 - Discount)) as decimal(15,3)) as nvarchar(25)) + ' TL') as ToplamSatis
from Employees e
join orders o on e.EmployeeID = o.EmployeeID
join [Order Details] od on o.OrderID = od.OrderID
group by (FirstName + ' ' + LastName)
order by ToplamSatis desc

-- SQL'de veri tipi donusumu icin CAST ve CONVERT metotlari kullanilir...

-- 2.LEFT JOIN: (Left Outer Join) Sorguya katilan tablolardan soldakinin tum kayitlari getirilirken, sagdaki tabloda sadece iliskili olan kayitlar getirilir. Inner join'den farki sudur; soldaki tablodaki kaydin sagdaki tabloda bir karsiligi yoksa bile ici null olarak doldurulup yine de getirilir. Inner join'de ise sagdaki tabloda karsiligi olmayan soldaki veriler getirilmez. 

-- Ilk once Products tablosuna CategoryID'sini yazmadan bir urun ekleyelim. Sadece ProductName'i dolduralim...
insert into Products (ProductName) values ('Dondurma')
-- Daha sonra Products ile Categories tablolarini CategoryID'lerinden left join ile birlestirelim...
select ProductName, CategoryName from Products
left join Categories on Products.CategoryID = Categories.CategoryID

-- Her bir calisani rapor verdigi kisiyle birlikte listeleyiniz...
select  
	e1.FirstName + ' ' + e1.LastName as Calisan,
	e2.FirstName + ' ' + e2.LastName as RaporVerilen
from Employees e1
left join Employees e2 on e1.ReportsTo = e2.EmployeeID

-- 3. RIGHT JOIN: (Right Outer Join) Sorguya katilan tablolardan sagdakinin tum verileri getirilirken, soldakine sadece iliskili olan kayitlar getirilir. 

-- Her bir calisani rapor verdigi kisiyle birlikte listeleyiniz...
select  
	e1.FirstName + ' ' + e1.LastName as RaporVerilen,
	e2.FirstName + ' ' + e2.LastName as Calisan
from Employees e1
right join Employees e2 on e1.EmployeeID = e2.ReportsTo

-- Categories tablosuna 2 adet kayit ekleyiniz. Daha sonra da Categories ile Products tablolarini right join ile birlestiriniz. CategoryName ve ProductName olarak listeleyiniz...
insert into Categories (CategoryName) values ('Cikolata')
insert into Categories (CategoryName) values ('Meyve')
select CategoryName, ProductName from Products p 
right join Categories c on c.CategoryID = p.CategoryID

-- 4. FULL JOIN: Her iki tablodaki tum kayitlar getirilir. Left ve right join'in birlesimidir.

-- Full join ile CategoryName ve ProductName sutunlarini listeleyiniz...
select CategoryName, ProductName from Categories c
full join Products p on c.CategoryID = p.CategoryID

-- 5. CROSS JOIN: Bir tablonun bir kaydini, diger tablonun tum kayitlariyla birlestirir.

-- Cross join ile CategoryName ve ProductName sutunlarini listeleyiniz...
select COUNT(*) from Categories
select COUNT(*) from Products

select CategoryName, ProductName from Categories cross join Products