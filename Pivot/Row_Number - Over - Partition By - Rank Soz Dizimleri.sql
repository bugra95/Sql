-- ROW_NUMBER(): Satirlar icin sanal id olusturur. Bu fonksiyon her satiri siralama ifadesine gore 1'den baslayarak ardisik olarak numaralandirir. 
-- ROW_NUMBER() Over(...) seklinde kullanilir...
select ROW_NUMBER() Over(order by ContactTitle), ContactTitle, CompanyName from Customers

-- Over icinde ayrica Partition by kullanimi ise, ayni degerlere sirali id verir...
select ROW_NUMBER() Over(Partition by ContactTitle order by ContactTitle), ContactTitle, CompanyName from Customers

-- Rank() ve Dense_Rank() metotlari ile, verilen bir sutuna gore her bir grup icin ayni sayi degeri uretilerek siralama yapilir. Aralarindaki fark; Rank() metodu degisen her grup icin baslangic satirinin satir numarasi ile, Dense_Rank() metodu ise gruplar arasi geciste bir artan sayi uretir...
select Rank() Over(order by ContactTitle), ContactTitle, CompanyName from Customers

select DENSE_RANK() Over(order by ContactTitle), ContactTitle, CompanyName from Customers

-- Rank() metodu ile distinct kullanarak ayni degerlerin birden fazla yazimindan kurtulabiliriz...
select distinct Rank() Over(order by ContactTitle), ContactTitle from Customers

-- ROW_NUMBER() ile derived bir tablo olusturarak listeleme...
select * from (select ROW_NUMBER() Over(order by CustomerID) as SatirNo, CompanyName, ContactTitle, City from Customers) as tbl where tbl.SatirNo between 0 and 10