/* FİRMALAR */
INSERT INTO 
    firmalar (firma_ad) 
VALUES 
    ('Sony'),
    ('Arçelik'),
    ('Beko'),
    ('Siemens'),
    ('Samsung'),
    ('Bershka'),
    ('Zara'),
    ('Pull Bear'),
    ('Mango'),
    ('Mavi'),
    ('Lego'),
    ('Fisher-Price'),
    ('Hot Wheels'),
    ('Barbie'),
    ('Hasbro'),
    ('Sephora'),
    ('Victoria Secret'),
    ('Fenty Beauty'),
    ('MAC Cosmetics'),
    ('Lancome'),
    ('Gübretaş'),
    ('BAYER');

/* ÜRÜN TİPLERİ */
INSERT INTO 
    urun_tipleri (tip_ad, risk_derecesi)
VALUES 
    ('Elektronik', 3),
    ('Giyim', 2),
    ('Oyuncak', 1),
    ('Kozmetik', 4),
    ('İlaç', 5);

/* ÜRÜNLER */
INSERT INTO 
    urun (urun_ad, tip_id)
VALUES 
    ('Buzdolabı', 1),
    ('Bilgisayar', 1),
    ('Çamaşır Makinesi', 1),
    ('Kurutma Makinesi', 1),
    ('Düzleştirici', 1),
    ('Kamera', 1),
    ('Süpürge', 1),
    ('Televizyon', 1),
    ('Tost Makinesi', 1),
    ('Kahve Makinesi', 1),

    ('Pantolon', 2),
    ('T-Shirt', 2),
    ('Elbise', 2),
    ('Gömlek', 2),
    ('Şort', 2),
    ('Crop', 2),
    ('Etek', 2),
    ('Ayakkabı', 2),
    ('Çanta', 2),
    ('Kemer', 2),

    ('LEGO Technic', 3),
    ('Oyuncak Araba', 3),
    ('Oyun Hamuru', 3),
    ('Oyuncak Bebek', 3),
    ('Araba Parkuru', 3),
    ('LEGO Speed', 3),
    ('Peluş', 3),
    ('LEGO Cities', 3),
    ('Doktor Seti', 3),
    ('Oyun Halısı', 3),

    ('Maskara', 4),
    ('Gloss', 4),
    ('Vücut Spreyi', 4),
    ('Parfüm', 4),
    ('Far Paleti', 4),
    ('Highlighter', 4),
    ('Kaş Sabitleyici', 4),
    ('Pudra', 4),
    ('Allık', 4),
    ('Nemlendirici', 4),

    ('Yabancı Ot İlacı', 5),
    ('Böcek İlacı', 5),
    ('Mantar İlacı', 5),
    ('Beşeri İlaç', 5),
    ('Üre Gübresi', 5),
    ('Yaprak Gübresi', 5),
    ('Özel Damlama Gübresi', 5),
    ('Taban Gübresi', 5),
    ('Amonyum Sülfat', 5),
    ('Potasyum Nitrat', 5);


/* KAPI TİPLERİ VE SINIR KAPILARI */
INSERT INTO 
    kapi_tipleri (tip_ad) 
VALUES 
    ('Karayolu'),
    ('Demiryolu');

INSERT INTO 
    sinir_kapilari (kapi_ad, peron_sayisi, kapi_tip_id) 
VALUES 
    ('Kapıkule', 24, 2),
    ('İpsala', 10, 1),
    ('Hamzabeyli', 20, 1),
    ('Pazarkule', 6, 1),
    ('Uzunköprü', 0, 2);



/* ÜLKELER */
INSERT INTO
    ulkeler (ulke_ad, ulke_kod)
VALUES 
    ('Türkiye','TR'),
    ('Bulgaristan','BG'),
    ('Almanya','DE'),
    ('Rusya','RU'),
    ('Çin','CN'),
    ('Belçika','BE'),
    ('Hollanda','NL'),
    ('Danimarka','DK'),
    ('İsveç','SE'),
    ('Portekiz','PT'),
    ('Bosna Hersek','BIH'),
    ('Hırvatistan','HR'),
    ('Sırbistan','RS'),
    ('Arnavutluk','AL'),
    ('Karadağ','ME'),
    ('Polonya','PL'),
    ('İrlanda','IE'),
    ('Birleşik Krallık','GB');


/* ARAÇ TİPLERİ VE ARAÇLAR */
INSERT INTO 
    arac_tipleri (tip_ad) 
VALUES 
    ('Sedan'),
    ('Hatchback'),
    ('SUV'),
    ('Kamyonet'),
    ('Minibüs'),
    ('Kamyon'),
    ('Tır'),
    ('Damperli Kamyon'),
    ('Panelvan'),
    ('Motosiklet');

INSERT INTO 
    araclar (plaka, ulke_kod, tip_id)
VALUES 
    ('20ACY200','TR',1),
    ('CB4912MK','BG',7),
    ('X7731AA','BG',2),
    ('BM2026','DE',1),
    ('HHTR883','DE',8),
    ('子A84888','CN',9),
    ('龜K9Z211','CN',8),
    ('A724EA777','RU',4),
    ('M2370021','RU',5),
    ('5-KLM-533','BE',10),
    ('7-CSD-672','BE',7),
    ('GB-123-X','NL',8),
    ('12-VLT-4','DK',2),
    ('XY98765','DK',3),
    ('KHU058','SE',10),
    ('MNG37A','SE',5),
    ('AA-00-BB','PT',1),
    ('BN-32-KV','PT',6),
    ('K12-M-837','BIH',1),
    ('048-T-792','BIH',5),
    ('ZG4812-AB','HR',1),
    ('ST991-ZZ','HR',7),
    ('BG123-AA','RS',4),
    ('NI987-ZZ','AL',6),
    ('AA852DG','AL',5),
    ('PGMN147','ME',8),
    ('BDAB654','ME',2),
    ('WI4421A', 'PL',6),
    ('KR99211','PL',3),
    ('261-D-4521','IE',4),
    ('252-G-881','IE',5),
    ('LN26ABC', 'GB',7),
    ('HW75XYZ','GB',5);


/* MEMURLAR */
INSERT INTO 
    memurlar (ad, soyad, gorev_birimi, kapi_id)
VALUES 
    ('Açelya','Yıldırım','Tescil ve Kabul Birimi', 1),
    ('Esra','Açar','Kaçakçılık ve İstihbarat Kısım Amirliği',1),
    ('Bennu Seyhan','Tünca', 'Gümrük Muayene Birimi',1),

    ('Abdülkadir','Karakaya','Muhasebe, Vezne ve Tasfiye Birimi', 2),
    ('Yavuz Taha','Tulumbacı','Gümrük Muhafaza Birimi',2),

    ('Fevzi Berke','Urganioğlu','Gümrük Muayene Birimi',3),
    ('Melek','Tavas','Tescil ve Kabul Birimi',3),

    ('Rüveyda','Kızıldağ','Kaçakçılık ve İstihbarat Kısım Amirliği',4),
    ('Enes','Karabacak','Muhasebe, Vezne ve Tasfiye Birimi',4),

    ('Selim','Türk','Gümrük Muhafaza Birimi',5),
    ('Alper','Aydoğdu','Gümrük Muayene Birimi',5);

/* BEYANNAMELER */
INSERT INTO 
    beyanname (tarih, deger, sonuc, plaka, memur_id, urun_id, firma_id)
VALUES 
/*  Kapıkule */
    (TIMESTAMP '2026-01-12 09:15:00', 450000.00, 'Onay', 'HHTR883', 1, 1, 4),
    (TIMESTAMP '2026-02-05 14:30:00', 850000.00, 'Onay', 'BM2026', 2, 44, 22),
    (TIMESTAMP '2026-03-18 11:45:00', 45000.50,  'Ret',  'CB4912MK', 3, 15, 6),
    (TIMESTAMP '2026-04-22 16:20:00', 125000.00, 'Onay', '子A84888', 1, 35, 16),
    (TIMESTAMP '2026-05-10 08:00:00', 75000.00,  'Onay', '20ACY200', 2, 10, 2),
    (TIMESTAMP '2026-05-28 19:10:00', 320000.00, 'Ret',  'GB-123-X', 3, 21, 11),
/* İpsala */
    (TIMESTAMP '2026-01-20 10:30:00', 180000.00, 'Onay', 'X7731AA', 4, 11, 7),
    (TIMESTAMP '2026-02-14 08:45:00', 410000.00, 'Onay', 'A724EA777', 5, 41, 21),
    (TIMESTAMP '2026-03-05 15:15:00', 650000.00, 'Ret',  'M2370021', 4, 2, 1),
    (TIMESTAMP '2026-04-12 11:20:00', 95000.00,  'Onay', '12-VLT-4', 5, 18, 8),
    (TIMESTAMP '2026-05-03 13:40:00', 210000.00, 'Onay', 'KHU058', 4, 34, 17),
    (TIMESTAMP '2026-05-22 09:30:00', 150000.00, 'Onay', 'CB4912MK', 5, 14, 9),

/* Hamzabeyli */
    (TIMESTAMP '2026-01-08 14:10:00', 65000.00,  'Onay', 'MNG37A', 6, 31, 19),
    (TIMESTAMP '2026-02-21 16:50:00', 110000.00, 'Onay', '7-CSD-672', 7, 22, 13),
    (TIMESTAMP '2026-03-14 09:20:00', 280000.00, 'Ret',  'AA-00-BB', 6, 3, 3),
    (TIMESTAMP '2026-04-05 11:30:00', 520000.00, 'Onay', 'BN-32-KV', 7, 45, 21),
    (TIMESTAMP '2026-05-15 15:45:00', 85000.00,  'Onay', 'ZG4812-AB', 6, 12, 10),
    (TIMESTAMP '2026-05-29 10:15:00', 195000.00, 'Onay', '7-CSD-672', 7, 28, 11),

/* Pazarkule */
    (TIMESTAMP '2026-01-25 13:00:00', 920000.00, 'Ret',  'BG123-AA', 8, 44, 22),
    (TIMESTAMP '2026-02-18 09:40:00', 135000.00, 'Onay', 'NI987-ZZ', 9, 13, 9),
    (TIMESTAMP '2026-03-22 14:25:00', 215000.00, 'Onay', 'AA852DG', 8, 24, 14),
    (TIMESTAMP '2026-04-16 10:05:00', 680000.00, 'Ret',  'PGMN147', 9, 8, 5),
    (TIMESTAMP '2026-05-08 16:50:00', 145000.00, 'Onay', 'BDAB654', 8, 39, 18),
    (TIMESTAMP '2026-05-30 08:30:00', 85000.00,  'Onay', 'NI987-ZZ', 9, 40, 20),
/* Uzunköprü */
    (TIMESTAMP '2026-01-15 11:10:00', 750000.00, 'Onay', 'WI4421A', 10, 49, 21),
    (TIMESTAMP '2026-02-28 15:35:00', 160000.00, 'Onay', 'KR99211', 11, 5, 4),
    (TIMESTAMP '2026-03-10 08:20:00', 190000.00, 'Onay', '261-D-4521', 10, 25, 15),
    (TIMESTAMP '2026-04-02 14:45:00', 75000.00,  'Ret',  '252-G-881', 11, 16, 6),
    (TIMESTAMP '2026-05-18 09:50:00', 115000.00, 'Onay', 'LN26ABC', 10, 32, 16),
    (TIMESTAMP '2026-05-31 17:30:00', 540000.00, 'Onay', 'HW75XYZ', 11, 42, 22);