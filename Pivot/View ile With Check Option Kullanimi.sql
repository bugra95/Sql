-- Once bir view olusturalim:
create view CalisanBilgileri as select FirstName, LastName, Title, City from Employees
-- Simdi, CalisanBilgileri isimli View'deki tum verileri listeleyelim:
select * from CalisanBilgileri
-- Daha sonra, bu view'in gorunumunu guncelleyelim. Bu view icinde sadece sehri London olanlar listelensin:
alter view CalisanBilgileri as
select FirstName, LastName, Title, City from Employees where City = 'London'

select * from CalisanBilgileri

-- Alter ifadesi ile bir table ya da view uzerinde degisiklik yapabiliyoruz. Aslinda alter ifadesi bir nevi filtreleme yapar. Artik o yapiyi sadece belirttigimiz sekilde gormemizi saglar...

-- Simdi CalisanBilgileri isimli View'a yeni bir satir ekleyelim:
insert into CalisanBilgileri values ('Duygu', 'Yenilmez', 'Software Developer', 'Izmir')

select * from CalisanBilgileri

-- View uzerinden insert yaptigimizda eklenen verinin, view ile belirtilen filtreye uygun olmasini saglamak amaciyla view'in yapisinda "with check option" ile degisiklik yapmamiz gerekiyor. With Check Option ifadesi, insert islemi icin de ayni filtrenin uygulanmasini saglar...
alter view CalisanBilgileri as select FirstName, LastName, Title, City from Employees where City = 'London' with check option

insert into CalisanBilgileri values ('Duygu', 'Yenilmez', 'Software Developer', 'London')

select * from CalisanBilgileri