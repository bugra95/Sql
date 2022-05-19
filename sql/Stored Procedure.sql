-- Stored Procedure (Sakli Yordamlar) icinde sorgu saklanan yapilardir. 

-- Yasadiklari sehirler null olmayan calisanlarin isim, soyisim ve gorevlerini listeleyen bir sp yazalim:
create procedure sp_CalisanlariGetir as
begin
	select FirstName, LastName, Title from Employees where City is not null
end

exec sp_CalisanlariGetir
-- NOT: procedure yerine kisaca proc ve execute yerine kisace exec kullanilabilir...

-- Tüm kategori isimleriyle, bu kategorilere ait urun isimlerini getiren bir sp yaziniz...
create procedure sp_UrunlerVeKategoriler as
begin
	select CategoryName, ProductName from Categories c 
	join Products p on c.CategoryID = p.CategoryID
end

exec sp_UrunlerVeKategoriler

-- Kategorisine gore urunleri getiren bir sp yaziniz. CategoryID alsin, urun adi ve kategori yazsin...
create procedure sp_UrunByKategori @id int as
begin
	select CategoryName, ProductName from Categories c 
	join Products p on c.CategoryID = p.CategoryID
	where c.CategoryID = @id
end

exec sp_UrunByKategori 5
exec sp_UrunByKategori @id=7

-- Asagidaki sp nasil calisir:
create procedure sp_asdasd @ad nvarchar(10) as
begin
	select FirstName, LastName from Employees
	where FirstName like ('%' + (@ad) + '%')
end

exec sp_asdasd 'y'

-- Adina ve soyadina gore calisanlari listeleyen bir sp yaziniz...
create procedure sp_Calisanlar @ad nvarchar(10), @soyad nvarchar(20) as
begin
	select * from Employees where FirstName = @ad and LastName = @soyad
end

exec sp_Calisanlar 'Duygu', 'Yenilmez'
exec sp_Calisanlar @soyad = 'Davolio', @ad = 'Nancy'

-- sp_Calisanlar isimli stored procedure'u sadece id, isim, soyisim, gorev ve unvan listeleyecek sekilde guncelleyiniz...
alter procedure sp_Calisanlar @ad nvarchar(10), @soyad nvarchar(20) as
begin
	select EmployeeID, FirstName, LastName, Title, TitleOfCourtesy from Employees where FirstName = @ad and LastName = @soyad
end

exec sp_Calisanlar @ad='Nancy', @soyad='Davolio'

-- sp_Calisanlar isim stored procedure'u siliniz...
drop procedure sp_Calisanlar

-- Customers tablosuna insert islemi yapan bir sp yaziniz...
create procedure sp_InsertCustomer @customerId nchar(5), @companyName nvarchar(40), @contactName nvarchar(30) = 'Belirtilmedi', @contactTitle nvarchar(30) = 'Belirtilmedi', @address nvarchar(60) = 'Belirtilmedi', @city nvarchar(15) = 'Belirtilmedi', @region nvarchar(15) = 'Belirtilmedi', @postCode nvarchar(10) = 'Belirtilmedi', @country nvarchar(15) = 'Belirtilmedi', @phone nvarchar(24) = 'Belirtilmedi', @fax nvarchar(24) = 'Belirtilmedi' as
begin
	insert into Customers values (@customerId, @companyName, @contactName, @contactTitle, @address, @city, @region, @postCode, @country, @phone, @fax)
end

exec sp_InsertCustomer 'BLGDM', 'Bilge Adam'
exec sp_InsertCustomer 'YNLMZ', 'Yenilmez Holding', 'Duygu Yenilmez'
exec sp_InsertCustomer @companyName='Turk Hava Yollari', @phone='444 0 777', @customerId='THY',@country='Turkey', @city='Istanbul'
select * from Customers where CustomerID = 'THY'

-- Kullanicinin belirttigi kategoriyi, eger kategoriler tablosunda yoksa ekleyen, varsa guncelleyen bir sp yaziniz... (CategoryName ve Description gonderilsin)
create proc sp_KategoriEkle @catName nvarchar(15), @desc ntext as
begin
	if exists(select CategoryName from Categories where CategoryName = @catName)
		begin
			update Categories set [Description] = @desc where CategoryName = @catName
			print 'Bu kategori daha onceden eklenmistir. Kategoriye ait aciklama bilgisi guncellenmistir...'
		end
	else
		begin
			insert into Categories (CategoryName, [Description]) values (@catName, @desc)
		end
end

exec sp_KategoriEkle 'Saraplar', 'Uzumden yapilirlar...'
select * from Categories

exec sp_KategoriEkle 'Saraplar', 'En ucuzu kopek oldurendir...'

-- Girilen 3 tane sayinin toplamini bulan bir sp yaziniz...
create proc sp_SayilariTopla @sayi1 int, @sayi2 int, @sayi3 int as
begin
	declare @toplam int
	set @toplam = @sayi1 + @sayi2 + @sayi3
	return @toplam
end

declare @sayilarinToplami int
exec @sayilarinToplami = sp_SayilariTopla 45,7,8
select @sayilarinToplami as Toplam

-- Girilen 3 sayinin toplamini ve ortalamasini bulan bir sp yaziniz...
create procedure sp_ToplamVeOrtalama @sayi1 int, @sayi2 int, @sayi3 int, @ortalama decimal(15,3) output as
begin
	declare @toplam int
	select @toplam = @sayi1 + @sayi2 + @sayi3
	select @ortalama = @toplam / 3.0
	return @toplam
end

declare @sonuc int, @ort decimal(15,3)
exec @sonuc = sp_ToplamVeOrtalama 6,66,666,@ort output
select @sonuc as Toplam, @ort as Ortalama

-- UrunVeKategori adinda bir sp olusturalim. Parametre olarak urun adi ve kategori adi alan, urun id olarak da output parametreye sahip olan bir sp olsun. Bu sp'ye gonderilen kategori eger daha onceden eklenmisse yeniden eklemek yerine, o kategorinin id'sini kullansin...

create proc sp_UrunVeKategori @urunAdi nvarchar(40), @kategoriAdi nvarchar(15), @girilenUrunId int out as
begin
	declare @kategoriId int
	if exists(select CategoryName from Categories where CategoryName = @kategoriAdi)
		begin 
			select @kategoriId = CategoryID from Categories where CategoryName = @kategoriAdi
		end
	else
		begin
			insert into Categories (CategoryName) values (@kategoriAdi)
			set @kategoriId = @@IDENTITY
		end

	insert into Products (ProductName, CategoryID) values (@urunAdi, @kategoriId)
	set @girilenUrunId = @@IDENTITY
end

-- NOT: @@IDENTITY degiskeni, SQL Server'da tanimli olan global bir degiskendir. Girilen son kaydin id bilgisini tutar...

declare @id int
exec sp_UrunVeKategori 'Doluca', 'Saraplar', @id out

declare @id int
exec sp_UrunVeKategori 'Harry Poter', 'Kitaplar', @id out

select * from Categories
select * from Products

-- Ilk once sp_InsertCategory adinda, kategori adi alan, kategori id'yi out tipinde parametre olarak alan ve eger gonderilen kategori adinda bir veri yoksa bunu insert eden bir sp yaziniz. Ardindan sp_InsertProduct adinda, urun adi, kategori adi, birim fiyat (default olarak 10 degerinde) alan ve eger gonderilen urun adinda bir veri yoksa bunu sp_InsertCategory procedure'unu kullanarak insert eden bir sp daha yaziniz...

create proc sp_InsertCategory @categoryName nvarchar(15), @categoryId int out as
begin
	if not exists(select CategoryName from Categories where CategoryName = @categoryName)
		begin
			insert into Categories (CategoryName) values (@categoryName)
			set @categoryId = @@IDENTITY
		end
	else
		begin
			select @categoryId = CategoryID from Categories where CategoryName = @categoryName
		end
end

create proc sp_InsertProduct @productName nvarchar(40), @categoryName nvarchar(15), @unitPrice money = 10 as
begin
	if exists(select ProductName from Products where ProductName = @productName)
		begin
			print 'Bu urun daha onceden eklendigi icin Products tablosu uzerinde herhangi bir kayit islemi gerceklesmemistir...'
		end
	else
		begin
			declare @kategoriId int
			exec sp_InsertCategory @categoryName, @kategoriId out
			insert into Products (ProductName, CategoryID, UnitPrice) values (@productName, @kategoriId, @unitPrice)
			print 'Belirtilen urun Products tablosuna eklenmistir. Urunun kayit numarasi: ' + CAST(@@IDENTITY as nvarchar) 
		end
end

exec sp_InsertProduct 'Futbol Topu', 'Futbol', 50
select * from Products where ProductID = 81

exec sp_InsertProduct 'Telefon', 'Elektronik', 999
select * from Products where ProductID = 82

select * from Categories