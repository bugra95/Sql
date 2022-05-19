-- SQL'de degisken tanimlamak icin declare ifadesi kullanilir: 
-- declare @degiskenAdi degiskenTuru

-- Northwind'de Products tablosunda UnitPrice'i en yuksek olan degeri tutan bir degisken tanimlayiniz...
declare @maksimumFiyat money = (select MAX(UnitPrice) from Products)
select * from Products where UnitPrice = @maksimumFiyat

-- SUBQUERY: Alt sorgu demektir. Biz yukaridaki ornekte icice sorgu yapmis olduk. Bunu acik halde yazarsak, subquery elde etmis oluruz:
select * from Products where UnitPrice = (select MAX(UnitPrice) from Products)
-- NOT: Subquery'lerde ilk once en icerdeki parantez calistirilir. En disa dogru devam eder...

-- Products tablosunda fiyati ortalama fiyatin ustunde olan urunlere ait tum verileri listeleyiniz...
select * from Products where UnitPrice > (select AVG(UnitPrice) from Products)

-- Products tablosunda Order Details icindeki ProductID'lere sahip tum verileri listeleyiniz...
select * from Products where ProductID in (select ProductID from [Order Details])

-- Products tablosunda Order Details icindeki ProductID'lere sahip olmayan tum verileri listeleyiniz...
select * from Products where ProductID not in (select ProductID from [Order Details])

-- Products tablosundaki urunlerin urun adi, birim fiyati, stok adedi ve kategori isimlerini listeleyiniz...
select 
	ProductName, 
	UnitPrice, 
	UnitsInStock, 
	(select CategoryName from Categories as c
	where c.CategoryID = p.CategoryID) as KategoriAdi 
from Products as p

-- NOT: Subquery'lerde her zaman tek sutun cagirilabilir!..

-- Employees tablosunda issiz olmayan kisilerin isim, soyisim ve islerini listeleyiniz...
select FirstName, LastName, Title from Employees
where Title in (select Title from Employees where Title is not null)

-- Orders tablosundaki ShipVia ile Shippers tablosundaki ShipperID'leri ayni olan kargo sirketlerini sirket adi, ID'leri ve tasidiklari siparis sayilari ile listeleyiniz...
select 
	(select CompanyName from Shippers as s where o.ShipVia = s.ShipperID) as KargoSirketi,
	ShipVia as ID,
	COUNT(*) as SiparisSayisi
from Orders as o
group by ShipVia

-- EXISTS: Subquery'yi calistirir, true ya da false cevap doner. Exists ya da not exists seklinde kullanilir.

-- Siparis veren calisanlarin isim, soyisim ve id'lerini listeleyiniz...
select FirstName, LastName, EmployeeID from Employees e
where exists (select EmployeeID from Orders o where e.EmployeeID = o.EmployeeID)

-- Siparis vermeyen calisanlarin isim, soyisim ve id'lerini listeleyiniz...
select FirstName, LastName, EmployeeID from Employees e
where not exists (select EmployeeID from Orders o where e.EmployeeID = o.EmployeeID)