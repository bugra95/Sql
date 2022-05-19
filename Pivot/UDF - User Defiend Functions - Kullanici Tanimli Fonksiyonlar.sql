-- SCALAR FUNCTIONS

-- Oncelikle ProductName, CategoryName, UnitPrice ve 1.18 Kdv dahil olarak UnitPrice'lari listeleyelim:
select 
	ProductName as UrunAdi,
	CategoryName as KategoriAdi,
	UnitPrice as BirimFiyati,
	UnitPrice * 1.18 as KDVliFiyat
from Products p 
join Categories c on p.CategoryID = c.CategoryID

-- Daha sonra KdvHesapla adinda bir fonksiyon tanimlayalim:
create function KdvHesapla(@fiyat money) returns money
begin
	return @fiyat * 1.18
end

-- Simdi olusturmus oldugumuz fonksiyonu kullanalim:
select 
	ProductName as UrunAdi,
	CategoryName as KategoriAdi,
	UnitPrice as BirimFiyati,
	dbo.KdvHesapla(UnitPrice) as KDVliFiyat
from Products p 
join Categories c on p.CategoryID = c.CategoryID

-- Diyelim ki, KDV oranlari dustu. Bu durumda fonksiyonumuzu degistirmemiz gerekiyor:
alter function KdvHesapla(@fiyat money) returns money
begin
	return @fiyat * 1.08
end

-- Kisilerin yaslarini hesaplacak bir UDF yaziniz...
create function YasHesapla(@dogumTarihi datetime) returns int
begin
	declare @yas int
	select @yas = DATEDIFF(YEAR, @dogumTarihi, GETDATE())
	return @yas
end

-- Bu fonksiyonu kullanarak Employees tablosundaki kisilerin isim, soyisim ve unvan bilgilerini tek sutunda ve yas bilgilerini bir baska sutunda olacak sekilde listeleyiniz...
select  
	TitleOfCourtesy + ' ' + FirstName + ' ' + LastName as Isimler,
	dbo.YasHesapla(BirthDate) as Yaslari
from Employees order by Yaslari desc

-- YilHesapla adinda, verilen tarihe gore kac yil gecmis donduren bir fonksiyon yaziniz. Daha sonra bu fonksiyonu calisanlarin unvan + isim + soyisim ve ise giris tarihlerinden bu gune kac yil gecmis bilgilerini listeletmek icin kullaniniz...
create function YilHesapla(@tarih datetime) returns int
begin
	return (Year(GETDATE()) - Year(@tarih))
end

select 
	TitleOfCourtesy + ' ' +  FirstName + ' ' + LastName as isimler,
	dbo.YilHesapla(HireDate) as KacYilGecmis
from Employees order by KacYilGecmis desc

-- TABLE-VALUED FUNCTIONS

create function CalisanBilgileriniGetir(@employeeID int) returns table
return select * from Employees where EmployeeID = @employeeID

select * from CalisanBilgileriniGetir(3)

select FirstName, LastName, Title from CalisanBilgileriniGetir(5)

-- Calisanlari isimlerinin bas harfine gore listeleyen bir fonksiyon yaziniz...
create function BasHarfineGoreGetir(@basHarf nvarchar(1)) returns table
return select * from Employees where LEFT(FirstName, 1) = @basHarf

select * from BasHarfineGoreGetir('A')

-- Parametre olarak verilen dogum tarihi ve yas degerlerini alarak, kisilerin dogum tarihlerinin yil, ay veya gun olarak doldurulup doldurulmadigini geri donen fonksiyonu yaziniz...
