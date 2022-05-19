-- Bir tablodaki verileri yatay olarak gostermemizi saglar. Yani satirlari sutunlara cevirir...

-- Nakliye sirketlerinin tasidigi siparis sayisini listeleyiniz...
select ShipVia, COUNT(*) as SiparisSayisi from Orders group by ShipVia
-- Bu sorguyu pivot kullanarak yazalim: 
select * from (select ShipVia, COUNT(*) as SiparisSayisi from Orders group by ShipVia) as tbl pivot (SUM(SiparisSayisi) for ShipVia in ([1], [2], [3])) as ptbl
-- NOT: Pivot kullanirken belirtilen kolon isimler [] icerisinde belirtilmeli ve virguller ayrilmalidir...

-- Employees tablosundaki gorev basliklari altinda calisan sayilarini listeleyiniz...
select Title from Employees group by Title -- komutuyla gorev baliklarina baktik

select * from (select Title, COUNT(*) as CalisanSayisi from Employees group by Title) as tbl pivot(SUM(CalisanSayisi) for Title in ([Inside Sales Coordinator],[Sales Manager],[Sales Representative],[Vice President, Sales])) as ptbl
-- Dilersek sorgu sonucuna baska basliklar da ekleyebiliriz, hatta belli kosullarla ciktiyi sekillendirebiliriz...
select * from (select Title, COUNT(*) as CalisanSayisi from Employees group by Title) as tbl pivot(SUM(CalisanSayisi) for Title in ([Inside Sales Coordinator],[Sales Manager],[Sales Representative],[Vice President, Sales],[Bilgi Islem Sorumlusu],[Departman Belli Degil])) as ptbl

-- sp_executesql Kullanimi: string SQL sorgularini calistirir. Kullanimi icin asagidaki ornegi inceleyelim...
declare @query nvarchar(50) = 'select * from Categories'
exec sp_executesql @query

-- sp_executesql ile pivot kullanimi ornegi...
declare @kolonAdi nvarchar(MAX)
declare @sorgu nvarchar(MAX)
select @kolonAdi = iif(@kolonAdi is null, '', @kolonAdi+',') + QUOTENAME(ShipperID) from Shippers
set @sorgu = 'select * from (select s.ShipperID, COUNT(*) as SiparisSayisi from Orders o join Shippers s on o.ShipVia = s.ShipperID group by s.ShipperID) as tbl pivot(SUM(SiparisSayisi) for ShipperID in ('+@kolonAdi+')) as ptbl'
exec sp_executesql @sorgu

-- QUOTENAME(): icerisine aldigi string ifadeyi [] icinde gonderir. 