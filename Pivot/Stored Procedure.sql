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