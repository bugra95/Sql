-- Employees tablosunda isimleri Michael olan kayitlarin isim, soyisim ve gorev sutunlarini listeleyiniz...
select FirstName, LastName, Title from Employees where FirstName like 'Michael'

-- Employees tablosunda adinin ilk harfi A olanlarin isim, soyisim ve gorev sutunlarini listeleyiniz...
select FirstName, LastName, Title from Employees where FirstName like 'A%'

-- Employees tablosunda soyadinin son harfi n olanlarin isim, soyisim ve gorevlerini isimleri alfabetik olacak sekilde listeleyiniz...
select FirstName, LastName, Title from Employees where LastName like '%n' order by FirstName asc

-- Employees tablosunda adinin icerisinde e harfi gecenlerin isim ve soyisimlerini ilk sutuna gore azalan olacak sekilde listeleyiniz...
select FirstName, LastName from Employees where FirstName like '%E%' order by 1 desc

-- Employees tablosunda adinin ilk harfi A ve L olanlarin isim ve soyisimlerini listeleyiniz...
select FirstName, LastName from Employees where FirstName like 'A%' or FirstName like 'L%'
   -- II.YOL:
select FirstName, LastName from Employees where FirstName like '[AL]%'

-- Employees tablosunda adinin icerisinde R veya T olanlarin isim ve soyisimlerini listeleyiniz...
select FirstName, LastName from Employees where FirstName like '%[rt]%'

-- Employees tablosunda adinin ilk harfi alfabetik olarak J ile R arasinda olanlarin isim ve soyisimlerini listeleyiniz...
select FirstName, LastName from Employees where FirstName like '[J-R]%'

-- Employees tablosunda adinin icerisinde A ile E arasinda tek karakter olan kayitlarin isim ve soyisimlerini listeleyiniz...
select FirstName, LastName from Employees where FirstName like '%a_e%'

-- Employees tablosunda adinin icerisinde A ile E arasinda iki karakter olan kayitlarin isim ve soyisimlerini listeleyiniz...
select FirstName, LastName from Employees where FirstName like '%a__e%'

-- Employees tablosunda adinin ilk harfi M olmayanlarin isim ve soyisimlerini listeleyiniz...
select FirstName, LastName from Employees where FirstName not like 'M%'
   -- II.YOL:
select FirstName, LastName from Employees where FirstName like '[^M]%'

-- Employees tablosunda adi T ile bitmeyen kayitlari isim ve soyisim sutunlariyla listeleyiniz...
select FirstName, LastName from Employees where FirstName not like '%T'
select FirstName, LastName from Employees where FirstName like '%[^T]'

-- Employees tablosunda adinin ilk harfi A ile I arasinda olmayan kayitlarin isim ve soyisim sutunlarini ilk sutuna gore alfabetik olarak listeleyiniz...
select FirstName, LastName from Employees where FirstName not like '[a-i]%' order by 1 asc
select FirstName, LastName from Employees where FirstName like '[^a-i]%' order by 1 asc

-- Employees tablosunda adinin 2. harfi A veya T olmayan kayitlarin isim ve soyisimlerini soyisimlerine gore alfabetik olarak listeleyiniz...
select FirstName, LastName from Employees where FirstName not like '_[AT]%' order by 2
select FirstName, LastName from Employees where FirstName like '_[^AT]%' order by 2

-- Employees tablosunda adinin ilk iki harfi LA, LN, AA veya AN olan kayitlari isim, soyisim ve gorev sutunlariyla isimlerine gore azalan sirada listeleyiniz...
select FirstName, LastName, Title from Employees 
where FirstName like '[LA][AN]%'
order by FirstName desc

-- Employees tablosuna adi Robert, soyadi Downey_Jr olan bir kayit ekleyiniz. Ardindan ayni tabloda soyadinin icerisinde _ karakter olan kayitlarin isim ve soyisimlerini listeleyiniz...
-- _ karakterinin ozel bir anlami oldugu icin bu karakteri siradan hale getirebilmek icin [] icerisinde kullanilmalidir. 
insert into Employees (FirstName, LastName) values ('Robert', 'Downey_Jr')
select FirstName, LastName from Employees where LastName like '%[_]%'
  -- II.YOL:
select FirstName, LastName from Employees where LastName like '%\_%' escape '\'

-- Customers tablosundan CustomerID'sinin 2. harfi A, 4. harfi T olanlarin %10'luk kismini CustomerID ve CompanyName sutunlariyla listeleyiniz...
select top 10 percent CustomerID, CompanyName from Customers where CustomerID like '_A_T%'