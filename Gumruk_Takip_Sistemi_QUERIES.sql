
/* 
-------------------------------------
Ön Proje Raporunda Belirtilen Sorular
-------------------------------------
*/

/*
    1)Sıkça rastlanılan ürünler hangi tip araçla ve hangi ülkeden geliyor?
    2)Ülkeye giren mallar en çok hangi risk derecesine ait?
    3)Belirli bir risk derecesine sahip ürünlerin toplam sayısı nedir?
    4)En çok denetim yapan memurun bilgileri nelerdir?
    5)En yüksek riskli ürünlerin geldiği sınır kapısı hangisidir?
    6)Kontrol durumu olumsuz olan kayıtların araç plakası, sınır kapısı ve tarih bilgilerinin listelenmesi.
    7)Ülkeye sokulmaya çalışan malların ne kadarı reddedilmiştir?
    8)Belirli bir günde giriş yapan malların listelenmesi.
*/

/*
--------------------------------------------
Proje Gelişimine Göre Revize Edilmiş Sorular
--------------------------------------------
*/

/*
    1)Gümrükten en çok geçiş yapan ürünler,hangi araç tipleriyle ve hangi menşei ülkelerinden gelmektedir?
    2)Risk derecesine göre onay alan işlem sayısı    
    3)Risk derecesi yüksek olan ürünlerin toplam beyanname işlem sayısı ve bu işlemlerin toplam parasal hacmi nedir?
    4)En çok beyanname inceleyen (işlem yapan) memurun adı, soyadı, görev birimi ve görev yaptığı sınır kapısı nedir?
    5)En yüksek riskli ürünler en çok hangi sınır kapısından işlem görmektedir?
    6)Sonucu 'Ret' olan beyannamelerin; işlem tarihi, araç plakası, ilgili firma ve işlemin yapıldığı sınır kapısı bilgilerinin listelenmesi.
    
    8)2026 ilk çeyrekte giriş yapan malların markalara ve ürün tiplerine göre listelenmesi.
*/

/*

    2)

    SELECT 
    ut.risk_derecesi, 
    COUNT(b.beyanname_no) AS onaylanan_islem_sayisi
    FROM beyanname b
    JOIN urun u ON b.urun_id = u.urun_id
    JOIN urun_tipleri ut ON u.tip_id = ut.tip_id
    WHERE b.sonuc = 'Onay'
    GROUP BY ut.risk_derecesi
    ORDER BY ut.risk_derecesi DESC;

    3)

    SELECT 
    ut.risk_derecesi,
    COUNT(b.beyanname_no) AS toplam_islem_sayisi, 
    SUM(b.deger) AS toplam_parasal_hacim
    FROM beyanname b
    JOIN urun u ON b.urun_id = u.urun_id
    JOIN urun_tipleri ut ON u.tip_id = ut.tip_id
    WHERE ut.risk_derecesi >= 4
    GROUP BY ut.risk_derecesi;

    4)
    
    SELECT 
    m.ad|| ' ' || m.soyad AS "Kontrol Eden Memur",
    m.gorev_birimi, 
    sk.kapi_ad, 
    COUNT(b.beyanname_no) AS inceleme_sayisi
    FROM beyanname b
    JOIN memurlar m ON b.memur_id = m.memur_id
    JOIN sinir_kapilari sk ON m.kapi_id = sk.kapi_id
    GROUP BY m.ad, m.soyad, m.gorev_birimi, sk.kapi_ad
    ORDER BY inceleme_sayisi DESC
    FETCH FIRST 1 ROWS ONLY;

    5)

    SELECT 
    sk.kapi_ad, 
    COUNT(b.beyanname_no) AS yuksek_risk_islem_sayisi
    FROM beyanname b
    JOIN urun u ON b.urun_id = u.urun_id
    JOIN urun_tipleri ut ON u.tip_id = ut.tip_id
    JOIN memurlar m ON b.memur_id = m.memur_id
    JOIN sinir_kapilari sk ON m.kapi_id = sk.kapi_id
    WHERE ut.risk_derecesi = 5
    GROUP BY sk.kapi_ad
    ORDER BY yuksek_risk_islem_sayisi DESC
    FETCH FIRST 1 ROW ONLY;

    6)

    SELECT 
    b.tarih, 
    b.plaka, 
    f.firma_ad, 
    sk.kapi_ad
    FROM beyanname b
    JOIN firmalar f ON b.firma_id = f.firma_id
    JOIN memurlar m ON b.memur_id = m.memur_id
    JOIN sinir_kapilari sk ON m.kapi_id = sk.kapi_id
    WHERE b.sonuc ='Ret'
    ORDER BY b.tarih DESC;

    8)

    SELECT 
    f.firma_ad AS marka, 
    ut.tip_ad AS urun_tipi, 
    COUNT(b.beyanname_no) AS toplam_gecis_sayisi,
    SUM(b.deger) AS toplam_deger
    FROM beyanname b
    JOIN firmalar f ON b.firma_id = f.firma_id
    JOIN urun u ON b.urun_id = u.urun_id
    JOIN urun_tipleri ut ON u.tip_id = ut.tip_id
    WHERE b.tarih BETWEEN TIMESTAMP '2026-01-01 00:00:00' AND TIMESTAMP '2026-03-31 23:59:59'
    GROUP BY f.firma_ad, ut.tip_ad
    ORDER BY toplam_gecis_sayisi DESC, marka ASC;


    1-7-9-10 -> 4 sorgu ihtiyacı mevcut.

*/