-- Group by kullanirken, gruplanacak sutuna gore Count ya da Sum metotlari kullanilir...

-- Employees tablosundaki calisanlarin ulkelerine gore gruplanmasi...
select Country as Ulke, COUNT(*) as 'Kisi Sayisi' from Employees
where Country is not null group by(Country)

-- Orders tablosunda calisanlarin yapmis oldugu siparis adedini buyukten kucuge gruplayiniz...
select EmployeeID, COUNT(*) as 'Siparis Adedi' from Orders
group by EmployeeID order by [Siparis Adedi] desc

-- Products tablosunda urun bedeli 35'ten az olan urunleri kategorilerine gore gruplayiniz...
select CategoryID, COUNT(*) as Adet from Products
where UnitPrice <= 35 group by CategoryID order by Adet

-- Products tablosunda bas harfi A ile K araliginda olan ve stok miktari 5 ile 50 arasinda olan urunleri kategorilerine gore gruplayiniz...
select CategoryID, COUNT(*) as KacTane from Products
where (ProductName like '[a-k]%') and (UnitsInStock between 5 and 50)
group by CategoryID order by KacTane

-- Order Details tablosundaki her bir siparisteki toplam urun sayisini bulunuz...
select OrderID, SUM(Quantity) as 'Toplam Urun Sayisi' from [Order Details]
group by OrderID

-- Order Details tablosunda her bir siparisi tutarina gore buyukten kucuge listeleyiniz...
select OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) as Tutar  from [Order Details] group by OrderID order by Tutar desc