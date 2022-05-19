-- Yazdigimiz sorgulari belirli kosullara gore filtrelemek icin WHERE ifadesini kullaniriz...

-- Northwind'de Employees tablosunda unvani Mr olanlari isim, soyisim ve unvan sirasiyla listeleyiniz...
select FirstName, LastName, TitleOfCourtesy from Employees where TitleOfCourtesy = 'Mr.'

-- Employees tablosunda EmployeeID'si 5'ten buyuk olanlari ID, isim, soyisim seklinde listeleyiniz...
select EmployeeID, FirstName, LastName from Employees where EmployeeID > 5

-- Employees tablosunda 1960 yilinda doganlari isim, soyisim ve dogum tarihi seklinde listeleyiniz...
-- year(datetime parametre) fonksiyonu bizden datetime cinsinden bir parametre alir ve bize yil degerini doner...
select FirstName, LastName, BirthDate from Employees where year(BirthDate) = 1960

-- Employees tablosunda 1950 ile 1961 yillari arasinda doganlarin isim, soyisim ve dogum tarihlerini listeleyiniz...
select FirstName, LastName, BirthDate from Employees 
where year(BirthDate) >= 1950 and year(BirthDate) <= 1961

-- Employees tablosunda Ingiltere'de oturan bayanlarin unvan, ad ve soyadlarini tek sutunda isim adiyla; gorevlerini gorev adiyla; dogum tarihlerini dogum tarihi adiyla ve ulkelerini ulke adiyla listeleyiniz...
select 
	TitleOfCourtesy + ' ' + FirstName + ' ' + LastName as isim,
	Title as gorev,
	BirthDate as 'dogum tarihi',
	Country as ulke
from Employees 
where Country = 'UK' and (TitleOfCourtesy = 'Ms.' or TitleOfCourtesy = 'Mrs.')

-- Employees tablosunda unvani Mr. olanlari veya yasi 60'tan buyuk olanlari unvan + isim + soyisim tek sutunda isim ve yaslari tek sutunda yas olacak sekilde listeleyiniz...
-- Getdate() fonksiyonu guncel tarih bilgisini verir...
select 
	TitleOfCourtesy + ' ' + FirstName + ' ' + LastName as isim, 
	year(getdate()) - year(BirthDate) as yas
from Employees
where TitleOfCourtesy = 'Mr.' OR year(getdate()) - year(BirthDate) > 60

-- Employees tablosunda bolgesi belirtilmeyen calisanlari isim, soyisim ve bolge sutunlariyla listeleyiniz...
select FirstName, LastName, Region from Employees where Region is null

-- Employees tablosunda bolgesi belirtilen calisanlari isim, soyisim ve bolge sutunlariyla listeleyiniz...
select FirstName, LastName, Region from Employees where Region is not null

-- NULL degerler sorgulanirken = gibi ifadeler ile karsilastirilmaz. Bunun yerine is null ya da is not null ifadeleri kullanilir...