--Hangi database'de query yazacaksam, onun adýný use ifadesi ile kullanýp, F5'e basabiliriz...
use NORTHWND

-- Employees tablosundaki tüm sütunlarýn verilerini listeleyiniz...
select * from Employees

select EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath from Employees

-- Employees tablosundan çalýþanlarýn ad, soyad, görev ve doðum tarihi bilgilerini listeleyiniz...
select FirstName, LastName, Title, BirthDate from Employees

select [FirstName],[LastName],[Title],[BirthDate] from Employees

-- Employees tablosundan çalýþanlarýn isim, soyisim ve postakodu bilgilerini listeleyiniz...
select FirstName, LastName, PostalCode from Employees

-- Employees tablosundan çalýþanlarýn id, isim, soyisim, görev ve þehir bilgilerini yine bu baþlýklarla listeleyiniz...
-- I.YOL:
select EmployeeID as id, FirstName as isim, LastName as soyisim, Title as görev, City as sehir from Employees

-- II.YOL:
select id=EmployeeID, isim=FirstName, soyisim = LastName, görev=Title, sehir = City from Employees

-- III.YOL: birden fazla kelimeden oluþan takma isim verirken ya tek týrnak içinde takma ismi kullanýrýz, ya da köþeli parantez içinde kullanýrýz...
select EmployeeID as id, 'ilk isim' = FirstName, [son isim] = LastName, Title as görev, sehir = City from Employees

-- Employees tablosundan çalýþanlarýn TitleOfCourtesy, FirstName, LastName, City bilgilerini Takma Ýsim, Ýlk Ýsim, Soyisim ve Þehir baþlýklarýyla listeleyiniz...
select TitleOfCourtesy as [Takma Ýsim], FirstName as [Ýlk Ýsim], LastName as Soyisim, City as Þehir from Employees

-- Distinct ile degerler tekil olarak listelenir... Ayni degerleri tekrar ettirmeden listeler...
select distinct City from Employees

-- Metinleri (kolonlari) birlestirmek...
select TitleOfCourtesy + ' ' + FirstName + ' ' + LastName as Kisiler from Employees

-- INSERT KOMUTU --
-- insert into tabloAdi (sutun isimleri) values (sutun degerleri)

select * from Categories
insert into Categories (CategoryName, Description) values ('Baklagiller', 'Vitamini kabugundadir...')

-- Categories tablosuna bir Description ekleyiniz...
insert into Categories (Description, CategoryName) values ('Deneme açıklaması', 'Deneme')

-- Eger bir tablodaki tum kolonlara ayni anda veri eklenecekse, kolon isimlerini yazmaya gerek yoktur. values ifadesinden sonra dogru sirada degerlerin girilmesi yeterlidir...

-- Shippers tablosuna MNG Kargo sirketini ekleyiniz...
select * from Shippers
insert into Shippers values ('MNG Kargo', '(312) 999-2277')

-- Shippers tablosuna (212) 111-2233 telefonunu ve Horoz Kargo sirketini bu yazim sirasiyla ekleyiniz...
insert into Shippers (Phone, CompanyName) values ('(212) 111-2233', 'Horoz Kargo')

-- Customers tablosuna Bilge Adam sirketini ekleyiniz...
insert into Customers (CustomerID, CompanyName) values ('BLGDM', 'Bilge Adam')
select * from Customers

-- UPDATE KOMUTU --
-- Bir tablodaki kayitlari guncellemek icin kullanilir. Dikkat edilmesi gereken sey, hangi kaydi guncelleyecegimizi belirtmektir! Aksi halde tum kayitlar ayni deger ile guncellenir!!!
-- update tabloAdi set sutunAdi = sutunDegeri, sutunAdi = sutunDegeri,... where kosul

-- tablo yedekleme...
select * into Calisanlar from Employees
select * from Calisanlar

-- Calisanlar tablosundaki butun kayitlarin soyadini tek bir degerle guncelleyiniz...
update Calisanlar set LastName = 'Yenilmez'
select * from Calisanlar

-- Calisanlar tablosundaki ID degeri 9 olan kaydin adi Ali, soyadi Oguz olsun...
update Calisanlar set FirstName = 'Ali', LastName = 'Oguz', TitleOfCourtesy = 'Mr.' where EmployeeID = 9
select * from Calisanlar

-- Products tablosundaki tum verileri Urunler adinda baska bir tabloya kopyalayiniz...
select * into Urunler from Products

-- Urunler tablosundaki her bir urune birim fiyati uzerinden %5'lik zam yapilsin...
select * from Urunler
update Urunler set UnitPrice = UnitPrice + (UnitPrice * 0.05)

-- DELETE KOMUTU --
-- Bir tablodan kayit silmek icin kullanilan komuttur. Ayni update gibi dikkat edilmesi gerekir. Cunku, birden fazla kayit yanlislikla silinebilir!!!
-- delete from tabloAdi where kosul

-- Calisanlar isimli tablodaki tum kayitlari siliniz...
delete from Calisanlar
select * from Calisanlar

-- Urunler tablosundaki adi Chai olan kaydi siliniz...
select * from Urunler
delete from Urunler where ProductName = 'Chai'

-- Calisanlar icinde adi Michael olan kayitlari siliniz...
insert into Calisanlar (FirstName, LastName) values ('Michael', 'Jordan')
insert into Calisanlar (FirstName, LastName) values ('Michael', 'Scoffield')
select * from Calisanlar
delete from Calisanlar where FirstName = 'Michael'

-- Calisanlar icinde unvani Mr ve Dr olanlari siliniz...
delete from Calisanlar where TitleOfCourtesy in ('Dr.', 'Mr.')
select * from Calisanlar
