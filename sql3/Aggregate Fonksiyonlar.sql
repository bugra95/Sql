-- Aggregate fonksiyonlar biz dizi deger uzerinde hesaplama yaparlar ve bize sonuc dondururler. COUNT(), SUM(), AVG(), MIN(), MAX() gibi...

-- Employees tablosundaki toplam kayit sayisini hesaplayiniz...
select COUNT(*) from Employees

-- Employees tablosundaki EmployeeID sutunundaki kayit sayisi kactir?
select COUNT(EmployeeID) from Employees

-- Employees tablosundaki Region sutunundaki kayit sayisi kactir?
select COUNT(Region) from Employees

-- NOT: Aggregate fonksiyonlari null deger iceren kayitlari dikkate almaz! Bu nedenle, kayit sayisini dogru bir sekilde ogrenebilmek icin ya null deger gecilemeyen sutunlardan birinin adini, ya da * karakterini kullanmaliyiz...

-- Employees tablosundaki City sutunundaki farkli sehirlerin sayisi kactir?
select COUNT(DISTINCT(City)) as 'Farkli sehir sayisi' from Employees

-- Employees tablosunda, EmployeeID sutunundaki degerlerin toplami kactir?
select SUM(EmployeeID) from Employees

-- Employees tablosunda calisanlarin yaslarinin toplamini bulunuz...
select SUM(DATEDIFF(YEAR, BirthDate, GETDATE())) as YasToplam from Employees
select SUM(YEAR(GETDATE()) - YEAR(BirthDate)) as ToplamYas from Employees

-- NOT: SUM() metodu ile sadece sayisal degerler kullanilabilir. Asagidaki gibi bir yazim hatali olur: 
select SUM(FirstName) from Employees

-- Employees tablosundaki ID'lerin ortalamasi kactir?
select AVG(EmployeeID) from Employees

-- Employees tablosundaki calisanlarin yaslarinin ortalamasi kactir?
select AVG(DATEDIFF(YEAR, BirthDate, GETDATE())) from Employees

-- NOT: AVG() metodu sadece sayisal degerler icin calisir...

-- Employees tablosundaki en buyuk ID kactir?
select MAX(EmployeeID) as EnBuyukID from Employees

-- Employees tablosundaki isimler alfabetik olarak siralandiginda en son hangi isim yazar?
select MAX(FirstName) from Employees

-- Employees tablosundaki calisanlar soyisimlerine gore alfabetik olarak azalan sekilde siralandiginda en son hangi isim gelir?
select MIN(LastName) from Employees