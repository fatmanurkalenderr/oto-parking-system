create database otopark
use otopark


create table aracın_bilgisi
(arac_id nvarchar(10) primary key , 
plaka_no nvarchar(10),
marka_model nvarchar(10),
park_id nvarchar(10) foreign key references park_bilgisi(park_id),
tarih date,
saat time )

create table park_bilgisi
(park_id nvarchar(10) primary key, 
konum nvarchar(20),
park_suresi nvarchar(20),
park_ücreti Money)



create table musteri_bilgisi
(musteri_id nvarchar(10) primary key,
ad nvarchar(20),
soyad nvarchar(20),
arac_id nvarchar(10) foreign key references aracın_bilgisi(arac_id),
telefon nvarchar(11), 
eposta nvarchar(30),  
cinsiyet nvarchar(10),
park_id nvarchar(10) foreign key references park_bilgisi(park_id))

insert into aracın_bilgisi values('p001', '34UM0410','JETTA', '011', '2021-05-25','10:00')
insert into aracın_bilgisi values('p002', '34AB0202','A6', '001', '2021-05-25','09:00')
insert into aracın_bilgisi values('p003', '34BB3333','Mustang', '010', '2021-05-25','11:00')
insert into aracın_bilgisi values('p004', '03CC3525','Egea', '002', '2021-05-25','12:00')
insert into aracın_bilgisi values('p005', '34DD4561','Pulsar', '003', '2021-05-25','13:00')
insert into aracın_bilgisi values('p006', '34DE1894','Alaskan', '004', '2021-05-25','14:00')
insert into aracın_bilgisi values('p007', '58EF1999','Pikap', '005', '2021-05-25','15:00')
insert into aracın_bilgisi values('p008', '54GG4215','civic', '006', '2021-05-25','16:00')
insert into aracın_bilgisi values('p009', '54HH1555','mazda 6','012', '2021-05-25','17:00')
insert into aracın_bilgisi values('p010', '34II3333','Corolla', '008', '2021-05-25','18:00')
insert into aracın_bilgisi values('p011', '06PU4865','VOLVO S90', '011', '2021-05-25','19:00')
insert into aracın_bilgisi values('p012', '06SI4568','PASSAT', '009', '2021-05-25','20:00')
insert into aracın_bilgisi values('p013', '34KI1515','PASSAT', '009', '2021-05-25','21:00')
insert into aracın_bilgisi values('p014', '34CI7848','PASSAT', '007', '2021-05-25','22:00')


insert into park_bilgisi values('001', '3K G10', '5 dakika', '15')
insert into park_bilgisi values('002', 'G A1', '20 dakika', '15')
insert into park_bilgisi values('003', 'G A15', '12 dakika', '15')
insert into park_bilgisi values('004', '1K B3', '78 dakika', '40')
insert into park_bilgisi values('005', '2K H2', '65 dakika', '40')
insert into park_bilgisi values('006', '2K B4', '60 dakika', '40')
insert into park_bilgisi values('007', '2K C0', '56 dakika', '40')
insert into park_bilgisi values('008', '1K F4', '305 dakika', '100')
insert into park_bilgisi values('009', '3K A0', '45 dakika', '15')
insert into park_bilgisi values('010', '3K C3', '70 dakika', '40')
insert into park_bilgisi values('011', '1K B22', '123 dakika', '40')
insert into park_bilgisi values('012', '2K A7', '48 dakika', '15')


insert into musteri_bilgisi values('müş1', 'ayşe', 'çakar', 'p001', '0533333333', 'aaaaaa@gmail.com', 'Kadın','001')
insert into musteri_bilgisi values('müş2', 'fatma', 'kalender', 'p002', '0544444444', 'bbbbbb@icloud.com', 'Kadın','002')
insert into musteri_bilgisi values('müş3', 'anıl', 'kalender', 'p003', '0555555555', 'ccc@gmail.com', 'Kadın','003')
insert into musteri_bilgisi values('müş4', 'yeter', 'fekik', 'p004', '0541111142', 'dsfdf@gmail.com', 'Erkek','004')
insert into musteri_bilgisi values('müş5', 'ali', 'keklik.', 'p005', '0500000002', 'sdfsfs@hotmail.com', 'Erkek','005')
insert into musteri_bilgisi values('müş6', 'tarık', 'kekin', 'p006', '0568454864', 'iasdfgg@gmail.com','Erkek','006')
insert into musteri_bilgisi values('müş7', 'aleyna', 'dekin', 'p007', '0545465454','fghjkm@gmail.com','Erkek','007')
insert into musteri_bilgisi values('müş8', 'gülçin', 'ekin', 'p008', '05564564516', 'vbnmmb@gmail.com','Erkek','008')
insert into musteri_bilgisi values('müş9', 'İlkim','tekin', 'p009', '0554845455', 'qwertt@gmail.com','Erkek','0009')

SELECT marka_model , plaka_no FROM aracın_bilgisi where park_id = 011
SELECT ad , count(cinsiyet) as 'cinsiyet sayısı' FROM musteri_bilgisi group by ad 
SELECT cinsiyet, musteri_id , count(cinsiyet) as 'cinsiyet sayısı' 
FROM musteri_bilgisi group by cinsiyet, musteri_id order by musteri_id
SELECT musteri_bilgisi.ad , musteri_bilgisi.soyad , park_bilgisi.konum, park_bilgisi.park_ücreti FROM musteri_bilgisi FULL OUTER JOIN park_bilgisi
ON musteri_bilgisi.park_id = park_bilgisi.park_id
SELECT park_id FROM aracın_bilgisi WHERE marka_model = 'PASSAT'
SELECT DISTINCT AD, soyad FROM musteri_bilgisi WHERE park_id in (SELECT park_id FROM aracın_bilgisi WHERE marka_model = 'PASSAT')