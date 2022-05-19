-- Employees tablosunda unvani Mr veya Dr olanlari isimlerine gore alfabetik olarak listeleyiniz...
select FirstName, LastName, TitleOfCourtesy from Employees where TitleOfCourtesy in ('Mr.', 'Dr.') order by FirstName asc

-- Employees tablosunda 1950, 1955 ve 1960 yillarinda doganlarin isim, soyisim ve dogum yillarini; dogum yillarina gore azalan sirada listeleyiniz...
select FirstName, LastName, BirthDate from Employees
where year(BirthDate) in (1950, 1960, 1955)
order by BirthDate desc