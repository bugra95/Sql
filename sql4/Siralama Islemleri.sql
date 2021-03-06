-- Siralama islemleri ORDER BY ifadesi kullanilarak gerceklestirilir. Order by ifadesi her zaman sorgu cumlelerinin en sonuna eklenir...

-- Employees tablosunda EmployeeID'leri 2 ile 8 arasinda olan tum sutunlari isimleri alfabetik sirayla olacak sekilde listeleyiniz...
select * from Employees where EmployeeID >= 2 and EmployeeID <= 8 order by FirstName asc

-- asc: Ascending anlamina gelir ve artan demektir. Bu ifadeyi yazmasak da asc olarak kabul eder...

-- Employees tablosunda dogum tarihine gore artan bir sekilde isim, soyisim ve dogum tarihi sutunlarini listeleyiniz...
select FirstName, LastName, BirthDate from Employees order by BirthDate

-- Employees tablosunda isim, soyisim, dogum tarihi ve ise giris tarihi sutunlarini soyisimler azalan sirada olacak sekilde listeleyiniz...
select FirstName, LastName, BirthDate, HireDate from Employees order by LastName desc

-- desc: Descending yani azalan demektir...

-- Employees tablosunda ilk ?nce Michael Jordan ve Michael Scoffield degerlerini ekleyiniz. Ardindan bu tablodaki isimleri alfabetik olarak artan, soyisimleri de azalan sirada listeleyiniz...
 insert into Employees (FirstName, LastName) values ('Michael', 'Jordan')
 insert into Employees (FirstName, LastName) values ('Michael', 'Scoffield')
 select * from Employees order by FirstName, LastName desc

 -- Employees tablosundaki kayitlari isim, soyisim, dogum tarihi, ise giris tarihi, gorev ve unvan sutunlari ile; unvan sutunundakiler artan ve ise giris tarihi sutunundakiler azalan olacak sekilde listeleyiniz...
 select FirstName, LastName, BirthDate, HireDate, Title, TitleOfCourtesy from Employees 
 order by 6, 4 desc

 -- Sorguda yazdigimiz sutunlarin sirasina gore siralama islemi yapabiliriz. SQL'de index'ler 1'den baslar...

 -- Employees tablosunda calisanlari unvanlarina gore ve unvanlari ayniysa yaslarina gore buyukten kucuge unvan, isim, soyisim ve yas sutunlarini siralayiniz...
 -- order by ifadesi ile sutunlara vermis oldugunuz takma isimleri kullanabilirsiniz!
 select 
	TitleOfCourtesy, FirstName, LastName, year(getdate()) - year(BirthDate) as yas
 from Employees
 order by TitleOfCourtesy desc, yas desc