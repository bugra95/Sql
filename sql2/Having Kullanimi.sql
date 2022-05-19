-- Sorgu sonucu gelen sonuc kumesi uzerinde Aggregate fonksiyonlarina bagli olacak sekilde bir filtreleme islemi yapacaksak, where yerine HAVING ifadesi kullanilir.

-- Order Details tablosunda toplam tutari 2500 ile 3500 arasinda olan siparisleri coktan aza dogru siralayiniz...
select OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) as Tutar from [Order Details]
group by OrderID 
having SUM(UnitPrice * Quantity * (1 - Discount)) between 2500 and 3500
order by Tutar desc

-- Order Details tablosundaki her bir siparisteki toplam urun sayisi 200'den az olan kayitlari azdan coga dogru listeleyiniz...
select OrderID, SUM(Quantity) from [Order Details] 
group by OrderID having SUM(Quantity) < 200 
order by SUM(Quantity) asc