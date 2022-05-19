-- Employees tablosundaki isim, soyisim ve ulke kolonlarini ulke bilgilerindeki USA yerine Amerika Birlesik Devletleri ve UK yerine Birlesik Krallik yazacak sekilde listeleyiniz...
select FirstName, LastName, Case(Country) 
	when 'USA' then 'Amerika Birlesik Devletleri'
	when 'UK' then 'Birlesik Krallik'
	end as Country 
from Employees

-- Employees tablosundaki kayitlari EmployeeID, FirstName ve Durum isimli sutunlar seklinde, Durum sutununda EmployeeID'si 5'ten buyuk, 5'ten kucuk, 5'e esit yazacak sekilde listeleyiniz...
select
	EmployeeID, FirstName, 
	case
		when EmployeeID < 5 then '5''ten kucuk'
		when EmployeeID > 5 then '5''ten buyuk'
		else '5''e esit'
	end as Durum
from Employees