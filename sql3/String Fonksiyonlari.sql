-- select komutu ile her zaman bir tabloyu listeletmek zorunda degiliz...
select 5 + 9 as Toplam, 5 - 9 as Fark, 5 * 9 as Carpim, 5 / 9 as Bolum, 5 % 2 as [Mod]

select 'YMS 8115 Yazilim Kursu - SQL Dersleri' as Mesaj
print 'YMS 8115 Yazilim Kursu - SQL Dersleri'

-- STRING METOTLARI --

-- ASCII() metodu, bir karakterin ascii kodunu verir...
select ASCII('A') as [Ascii Kodu]
select ASCII('a') as [Ascii Kodu]

-- CHAR() metodu, ascii kodu verilen bir degerin karakter karsiligini verir...
select CHAR(65) as Karakter
select CHAR(97) as Karakter

-- CHARINDEX() metodu, aratmak istedigimiz karakterin kacinci index'te oldugunu verir. Bulamazsa geriye 0 dondurur!..
select CHARINDEX('U', 'Duygu Yenilmez') as Yeri

-- LEFT() metodu, verilen bir metnin solundan verilen uzunluk kadarini geri dondurur...
select LEFT('Bilge Adam', 3) as 'Soldan Kesik'

-- RIGHT() metodu, verilen bir metnin sagindan verilen uzunluk kadarini geri dondurur...
select RIGHT('Bilge Adam', 7) as 'Sagdan Kesik'

-- LEN() metodu, verilen metnin uzunlugunu dondurur...
select LEN('Bilge Adam') as Uzunluk

-- LOWER() metodu, verilen metni tamamen kucuk harfe cevirir...
select LOWER('BiLGe ADAm') as 'Hepsi Kucuk'

-- UPPER() metodu, verilen metni tamamen buyuk harfe cevirir...
select UPPER('bilge adam') as 'Hepsi Buyuk'

-- LTRIM() metodu, bir metnin sol tarafindaki bosluklari siler...
select LTRIM('                              Bilge Adam') as 'Soldan Bosluksuz'

-- RTRIM() metodu, bir metnin sag tarafindeki bosluklari siler...
select RTRIM('Bilge Adam                                   ') as 'Sagdan Bosluksuz'

-- TRIM metodu olmadigi icin, hem sagdan hem de soldan bosluklari yok etmek icin LTRIM ve RTRIM metotlarini icice kullaniriz...
select LTRIM(RTRIM('                                        Bilge Adam                                      ')) as Bosluksuz
select RTRIM(LTRIM('                                        Bilge Adam                                      ')) as Bosluksuz

-- REPLACE() metodu, bir metnin icinde belirtilen metinlerin yerine, belirtilen diger metinleri yerlestirir...
select REPLACE('Birbirlerine', 'bir', 'uc') as 'Yeni Metin'

-- SUBSTRING() metodu, bir metnin icindeki belirtilen yerinden belirtilen uzunlukta alt metinleri verir...
select SUBSTRING('Bilge Adam Town Center', 4, 10) as 'Alt Metin'

-- REVERSE() metodu, bir metni tersine cevirir...
select REVERSE('Bilge Adam Town Center') as Tersi

-- SPACE() metodu, belirtilen sayida bosluk karakteri yerlestirir...
select 'Bilge' + SPACE(30) + 'Adam' as Bosluklu

-- REPLICATE() metodu, bir metni verilen sayida cogaltir...
select REPLICATE('Bilge Adam', 7) as Cogalan

-- ' isareti ozel bir anlam ifade ettigi icin, ' yazdirabilmek icin yanyana iki tane ' kullanmaliyiz... ('' gibi)
print 'Ali''lerin'
select EmployeeID as 'ID''leri' from Employees