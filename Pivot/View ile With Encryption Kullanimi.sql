-- View'i olusturan kodlarin baskalari tarafindan goruntulenmesini istemiyorsak, bu kodlari with encryption ile sifreleyebiliriz. Ancak burada dikkat edilmesi gereken sey, sifreleme uygulanacak olan view'in kodlarinin bir yerde kayitli tutulmasi gerekmektedir cunku sifreleme uygulandiktan sonra biz de bu kodlari bir daha goremeyiz!..

alter view CalisanBilgileri with encryption as
select FirstName, LastName, Title, City from Employees where City = 'London'

-- Bir view'in sifresini kaldirmak icin with encryption belirtmeden kodunu yazmamiz gerekiyor:
alter view CalisanBilgileri as
select FirstName, LastName, Title, City from Employees where City = 'London'

-- UrunlerVeKategoriler adinda ProductName, UnitPrice, UnitsInStock ve CategoryName sutunlarindan olusan bir view olusturunuz ve bu view'i sifreleyiniz...
create view UrunlerVeKategoriler as
select ProductName, UnitPrice, UnitsInStock, CategoryName from Products p 
join Categories c on p.CategoryID = c.CategoryID

alter view UrunlerVeKategoriler with encryption as
select ProductName, UnitPrice, UnitsInStock, CategoryName from Products p 
join Categories c on p.CategoryID = c.CategoryID