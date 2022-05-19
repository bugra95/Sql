-- Aralik belirtmek icin kullanilan ifadelerdir. Between ve And ile belirtilen ifadeler araliga dahil eder!..

-- Employees tablosunda 1952 ile 1960 yillari arasinda doganlari dogum yilina gore azalan sekilde listeleyiniz...
select FirstName, LastName, BirthDate from Employees
where year(BirthDate) between 1952 and 1960
order by BirthDate desc

-- Employees tablosunda isim ve soyisim sutunlarini, isimler alfabetik olarak Janet ve Robert arasinda olacak sekilde listeleyiniz...
select FirstName, LastName from Employees
where FirstName between 'Janet' and 'Robert'
order by FirstName asc