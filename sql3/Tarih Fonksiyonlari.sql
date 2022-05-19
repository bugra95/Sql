-- Bir tarih bilgisinden istedigimiz kismi datepart() metodu ile cekeriz...

select FirstName, LastName, DATEPART(YY, BirthDate) as [Year] from Employees
order by [Year] desc

select FirstName, LastName, DATEPART(DY, BirthDate) as [DayOfYear] from Employees
order by [DayOfYear] desc

select FirstName, LastName, DATEPART(M, BirthDate) as [Month] from Employees
order by [Month] desc

select FirstName, LastName, DATEPART(WK, BirthDate) as [WeekOfYear] from Employees
order by [WeekOfYear] desc

select FirstName, LastName, DATEPART(DW, BirthDate) as [DayOfWeek] from Employees
order by [DayOfWeek] desc

select FirstName, LastName, DATEPART(HH, GETDATE()) as [Hour] from Employees
order by [Hour] desc -- Su anki saati ceker (GetDate())

select FirstName, LastName, DATEPART(MI, GETDATE()) as [Minute] from Employees
order by [Minute] desc -- Su anki dakikayi ceker (GetDate())

select FirstName, LastName, DATEPART(SS, GETDATE()) as [Second] from Employees
order by [Second] desc -- Su anki saniyeyi ceker (GetDate())

select FirstName, LastName, DATEPART(MS, GETDATE()) as [MilliSecond] from Employees
order by [MilliSecond] desc -- Su anki milisaniyeyi ceker (GetDate())

-- DateDiff() metodu ile iki tarih arasindaki farki elde ederiz. 
select 
	FirstName + ' ' + LastName as Isimler, 
	DATEDIFF(YEAR, BirthDate, GETDATE()) as Yas,
	DATEDIFF(DAY, HireDate, GETDATE()) as KacGunGecmis
from Employees

select FirstName as isim, DATEDIFF(HOUR, BirthDate, GETDATE()) as 'Kac Saat Gecti' from Employees