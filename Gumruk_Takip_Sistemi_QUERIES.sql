
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
--------------------------------------------------------------
Proje Gelişimine Göre Revize Edilmiş Ve Değiştirilmiş Sorular
--------------------------------------------------------------
*/

/*
    1)Gümrük Muayene Birimindeki memurların incelediği en düşük değerli işlem nedir? 
    2)Risk derecesine göre onay alan işlem sayısını listeleyiniz. 
    3)En çok beyanname inceleyen (işlem yapan) memurun adı, soyadı, görev birimi ve görev yaptığı sınır kapısı nedir?
    4)Risk derecesi yüksek olan ürünlerin toplam beyanname işlem sayısı ve bu işlemlerin toplam parasal hacmi nedir?
    5)En yüksek riskli ürünler en çok hangi sınır kapısından işlem görmektedir? 
    6)Sonucu 'Ret' olan beyannamelerin; işlem tarihi, araç plakası, ilgili firma ve işlemin yapıldığı sınır kapısı bilgilerinin listelenmesi. 
    7)Daha önce 'Ret' almış ülkelerden gelen onaylı araçların listesi.
    8)2026 ilk çeyrekte giriş yapan malların markalara ve ürün tiplerine göre listelenmesi. 
    9)Peron sayısı 10'dan fazla olan sınır kapılarında değeri 100.000'den büyük olan ve gümrükten 'Ret' alan beyannameler. 
    10)İsminin içinde 'Makinesi' geçen ve değeri 50.000'den büyük olan elektronik ürünlerin listelenmesi.
*/

/*
    // Her şeyi gördüğümüz view tablomuz 

    CREATE OR REPLACE VIEW vw_beyanname_genel_detay AS
    SELECT 
        b.beyanname_no,
        b.tarih AS islem_tarihi,
        b.deger AS beyan_degeri,
        b.sonuc AS islem_sonucu,
        f.firma_ad AS marka_firma,
        u.urun_ad AS urun_adi,
        ut.tip_ad AS urun_kategorisi,
        ut.risk_derecesi AS urun_risk_derecesi,
        b.plaka AS arac_plakasi,
        at.tip_ad AS arac_tipi,
        ul.ulke_ad AS mensei_ulke,
        m.ad || ' ' || m.soyad AS görevli_memur,
        m.gorev_birimi AS memur_birimi,
        sk.kapi_ad AS sinir_kapisi
    FROM beyanname b
    INNER JOIN firmalar f ON b.firma_id = f.firma_id
    INNER JOIN urun u ON b.urun_id = u.urun_id
    INNER JOIN urun_tipleri ut ON u.tip_id = ut.tip_id
    INNER JOIN araclar a ON b.plaka = a.plaka
    INNER JOIN arac_tipleri at ON a.tip_id = at.tip_id
    INNER JOIN ulkeler ul ON a.ulke_kod = ul.ulke_kod
    INNER JOIN memurlar m ON b.memur_id = m.memur_id
    INNER JOIN sinir_kapilari sk ON m.kapi_id = sk.kapi_id;


    1)
    
    SELECT
    b.beyanname_no AS "Beyanname No",
    f.firma_ad AS "Beyan Eden Firma",
    b.deger AS "Beyan Değeri"
    FROM beyanname b
    JOIN firmalar f
    ON b.firma_id=f.firma_id 
    WHERE b.deger =(
        SELECT MIN(b2.deger)
        FROM beyanname b2
        JOIN memurlar m
        ON b2.memur_id=m.memur_id
        WHERE m.gorev_birimi='Gümrük Muayene Birimi'
    );

    2)

    SELECT 
    ut.risk_derecesi AS "Risk Derecesi",
    COUNT(b.beyanname_no) AS "Onaylanan İşlem Sayısı"
    FROM beyanname b
    JOIN urun u
    ON b.urun_id = u.urun_id
    JOIN urun_tipleri ut
    ON u.tip_id=ut.tip_id
    WHERE b.sonuc='Onay'
    GROUP BY ut.risk_derecesi 
    ORDER BY ut.risk_derecesi DESC;
    
    3)

    SELECT 
    m.ad || ' ' || m.soyad AS "Görevli Memur",
    m.gorev_birimi AS "Görev Birimi",
    sk.kapi_ad AS "Sınır Kapısı",
    COUNT(b.beyanname_no) AS "İşlem Sayısı"
    FROM beyanname b
    JOIN memurlar m
    ON b.memur_id=m.memur_id
    JOIN sinir_kapilari sk
    ON m.kapi_id=sk.kapi_id
    GROUP BY m.ad,m.soyad,m.gorev_birimi,sk.kapi_ad 
    HAVING COUNT(b.beyanname_no) =(
        SELECT MAX(COUNT(b2.beyanname_no))
        FROM beyanname b2
        JOIN memurlar m2
        ON b2.memur_id=m2.memur_id
        GROUP BY m2.memur_id
    )
    ORDER BY "Görevli Memur" ASC;


    

    4)
    SELECT 
    ut.risk_derecesi AS "Risk Derecesi",
    COUNT(b.beyanname_no) AS "Riskli İşlem Sayısı",
    SUM(b.deger) AS "İşlemin Toplam Değeri"
    FROM beyanname b
    JOIN urun u
    ON b.urun_id=u.urun_id
    JOIN urun_tipleri ut
    ON u.tip_id=ut.tip_id
    WHERE ut.risk_derecesi > 3
    GROUP BY ut.risk_derecesi
    ORDER BY ut.risk_derecesi DESC;
    
    
    5)

    SELECT 
    sk.kapi_ad AS "Sınır Kapısı",
    COUNT(b.beyanname_no) AS "En Yüksek Riskli İşlem Sayısı"
    FROM Beyanname b
    JOIN memurlar m
    ON b.memur_id=m.memur_id
    JOIN sinir_kapilari sk 
    ON m.kapi_id=sk.kapi_id
    JOIN urun u
    ON b.urun_id=u.urun_id
    JOIN urun_tipleri ut
    ON u.tip_id=ut.tip_id
    WHERE ut.risk_derecesi =(
        SELECT MAX(ut2.risk_derecesi)
        FROM urun_tipleri ut2
    )
    GROUP BY sk.kapi_ad 
    ORDER BY COUNT(b.beyanname_no)DESC
    FETCH FIRST 1 ROW ONLY;

    6)

    SELECT 
    b.tarih AS "İşlem Tarihi",
    b.plaka AS "Araç Plakası",
    f.firma_ad AS "İlgili Firma",
    sk.kapi_ad AS "Geçtiği Sınır Kapısı"
    FROM beyanname b
    JOIN firmalar f
    ON b.firma_id=f.firma_id
    JOIN memurlar m
    ON b.memur_id=m.memur_id
    JOIN sinir_kapilari sk
    ON m.kapi_id=sk.kapi_id
    WHERE b.sonuc='Ret'
    ORDER BY b.tarih DESC;

    7)
        SELECT 
    b.beyanname_no AS "Beyanname No",
    b.plaka AS "Araç Plakası",
    b.sonuc AS "İşlem Sonucu"
    FROM beyanname b
    JOIN araclar a
    ON b.plaka=a.plaka
    WHERE b.sonuc='Onay'
    AND a.ulke_kod IN(
        SELECT a2.ulke_kod
        FROM araclar a2
        JOIN beyanname b2
        ON a2.plaka=b2.plaka
        WHERE b2.sonuc='Ret'
        )
    ORDER BY b.beyanname_no ASC;

    8)

    SELECT
    f.firma_ad AS "Marka",
    ut.tip_ad AS "Ürün Tipi",
    COUNT(b.beyanname_no) AS "Toplam Geçiş Sayısı",
    SUM(b.deger) AS "Toplam Değer"
    FROM beyanname b
    JOIN urun u
    ON b.urun_id=u.urun_id
    JOIN urun_tipleri ut
    ON u.tip_id=ut.tip_id
    JOIN firmalar f
    ON b.firma_id=f.firma_id
    WHERE b.tarih BETWEEN TIMESTAMP '2026-01-01 00:00:00' 
    AND TIMESTAMP '2026-03-31 23:59:59'
    GROUP BY f.firma_ad, ut.tip_ad
    ORDER BY "Toplam Geçiş Sayısı" DESC, "Marka" ASC;

    9)
    SELECT
    b.beyanname_no AS "Beyanname No",
    b.deger AS "Beyan Değeri",
    sk.kapi_ad AS "Sınır Kapısı"
    bFROM beyanname b
    JOIN memurlar m
    ON b.memur_id=m.memur_id
    JOIN sinir_kapilari sk
    ON m.kapi_id=sk.kapi_id
    WHERE b.sonuc='Ret'
    AND b.deger>100000
    AND sk.peron_sayisi>10
    ORDER BY b.beyanname_no;

    10)
    SELECT 
    b.beyanname_no AS "Beyanname No",
    u.urun_ad AS "Ürün",
    b.deger AS "Ürün Değeri",
    b.sonuc AS "İşlem Sonucu"
    FROM beyanname b
    JOIN urun u 
    ON b.urun_id=u.urun_id
    JOIN urun_tipleri ut
    ON u.tip_id=ut.tip_id
    WHERE ut.tip_ad ='Elektronik'
    AND b.deger >50000
    AND u.urun_ad LIKE '%Makinesi'
    ORDER BY b.beyanname_no ASC; 
*/