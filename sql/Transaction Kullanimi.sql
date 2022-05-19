-- Products tablosuna kategorisi Yemekler olan bir urun ekleyelim. Ardindan o urun icin 10248 OrderID'li bir urun detayi olusturalim. Eger urunun kategorisi veritabaninda mevcut ise islem gerceklestirilsin, mevcut degil ise bu iki islem de gerceklestirilmesin...
begin try
	begin transaction trn;
	if exists(select * from Categories where CategoryName = 'Yemekler')
		begin
			declare @catID int;
			select @catID = CategoryID from Categories where CategoryName = 'Yemekler';

			insert into Products (ProductName, UnitPrice, UnitsInStock, CategoryID) values ('Kadinbudu Kofte', 9, 25, @catID);

			insert into [Order Details] (OrderID, ProductID, Quantity, UnitPrice, Discount) values (10248, SCOPE_IDENTITY(), 2, 9, 0);
		end
	else
		begin
			print 'Yemekler adinda bir kategori bulunmamaktadir...'
		end

	commit transaction trn;
end try
begin catch
	rollback transaction trn;

	select ERROR_MESSAGE() as 'Hata Mesaji', ERROR_LINE() as 'Hata Satiri', ERROR_NUMBER() as 'Hata Kodu'
end catch

insert into Categories (CategoryName, Description) values ('Yemekler', 'Leziz')

select * from Categories
select * from Products
select * from [Order Details]