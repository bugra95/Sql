/* 
	create trigger TriggerAdi on TabloAdi
	after / instead of    insert / delete / update    as
	begin
		.......
	end
*/

-- Categories tablosuna insert islemi yapildiktan sonra tetiklenen ve tabloya eklenen kategori adini ekrana yazdiran bir trigger olusturalim...
create trigger EklenenVeriyiGoster on Categories
after insert as
	begin
		declare @name nvarchar(15);
		select @name = CategoryName from inserted;
		print @name + ' kategorisi eklendi...';
	end

insert into Categories (CategoryName) values ('Tatlilar')

-- Categories tablosundan veri silinmesini engelleyen ve ekrana bu tablodan veri silinemez mesajini basan bir trigger yaziniz...
create trigger Silme on Categories
instead of delete as
begin
	print 'Bu tablodan veri silinemez!'
end

delete from Categories where CategoryName = 'Saraplar'
select * from Categories where CategoryName = 'Saraplar'

-- Order Details tablosunda bir sipariste bir urun satildiginda, o urunun stok miktarindan satilan miktar kadar azaltan trigger yaziniz. (Order Details uzerinde insert islemi icin after trigger yazilacak)...
create trigger KayitEklendi on [Order Details]
after insert as
begin
	declare @urunId int, @miktar smallint;
	select @urunId = ProductID, @miktar = Quantity from inserted;

	update Products set UnitsInStock = UnitsInStock - @miktar where ProductID = @urunId
end

select * from [Order Details] where ProductID = 75
select * from Products where ProductID = 75

insert into [Order Details] (OrderID, ProductID,UnitPrice,Quantity,Discount) values (10267,75,7.75,25,0)

-- Order Details tablosundan bir kayit silindiginde Products tablosunda guncelleme yapacak olan bir trigger yaziniz...
create trigger KayitSilindi on [Order Details]
after delete as
begin
	declare @urunId int, @miktar smallint;
	select @urunId = ProductID, @miktar = Quantity from deleted;

	update Products set UnitsInStock = UnitsInStock + @miktar where ProductID = @urunId
end

select * from [Order Details] where ProductID = 75 and OrderID = 10670
select * from Products where ProductID = 75

delete from [Order Details] where OrderID = 10670 and ProductID = 75

-- Order Details tablosunda herhangi bir kayit guncellendikten sonra Products tablosunda dogru guncellemeyi yapan bir trigger yaziniz...
create trigger KayitGuncellendi on [Order Details]
after update as
begin
	declare @yeniMiktar int, @eskiMiktar int, @urunId int;
	select @urunId = ProductID, @yeniMiktar = Quantity from inserted;
	select @eskiMiktar = Quantity from deleted;

	update Products set UnitsInStock = UnitsInStock + @eskiMiktar - @yeniMiktar where ProductID = @urunId;
end

select * from [Order Details] where ProductID = 75 and OrderID = 10267
select * from Products where ProductID = 75

update [Order Details] set Quantity = 30 where ProductID = 75 and OrderID = 10267