/* TABLOLAR*/
CREATE TABLE urun_tipleri(
    tip_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tip_ad VARCHAR2(100) NOT NULL,
    risk_derecesi NUMBER DEFAULT 0 CHECK(risk_derecesi >= 0 AND risk_derecesi <= 5)
);

CREATE TABLE urun(
    urun_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    urun_ad VARCHAR2(100) NOT NULL,
    tip_id NUMBER,
    FOREIGN KEY (tip_id) REFERENCES urun_tipleri(tip_id)  
);

CREATE TABLE firmalar(
    firma_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    firma_ad VARCHAR2(100) NOT NULL
);

CREATE TABLE ulkeler(
    ulke_kod VARCHAR2(5) PRIMARY KEY,
    ulke_ad VARCHAR2(100) NOT NULL     
);

CREATE TABLE arac_tipleri(
    tip_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tip_ad VARCHAR2(100) NOT NULL     
);

CREATE TABLE araclar(
    plaka VARCHAR2(15) PRIMARY KEY,
    ulke_kod VARCHAR2(5),
    tip_id NUMBER,
    FOREIGN KEY (tip_id) REFERENCES arac_tipleri(tip_id),
    FOREIGN KEY (ulke_kod) REFERENCES ulkeler(ulke_kod) 
);

CREATE TABLE kapi_tipleri(
    tip_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tip_ad VARCHAR2(100) NOT NULL
);

CREATE TABLE sinir_kapilari(
    kapi_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    kapi_ad VARCHAR2(100) NOT NULL,
    peron_sayisi NUMBER,
    kapi_tip_id NUMBER,
    FOREIGN KEY (kapi_tip_id) REFERENCES kapi_tipleri(tip_id)
);

CREATE TABLE memurlar(
    memur_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ad VARCHAR2(100) NOT NULL,
    soyad VARCHAR2(100) NOT NULL,
    gorev_birimi VARCHAR2(100) NOT NULL,
    kapi_id NUMBER,
    FOREIGN KEY (kapi_id) REFERENCES sinir_kapilari(kapi_id)
);

CREATE TABLE beyanname(
    beyanname_no NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tarih TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deger NUMBER(15,2) NOT NULL,
    sonuc VARCHAR2(10) NOT NULL CHECK (sonuc IN ('Onay','Ret')),
    plaka VARCHAR2(15) NOT NULL,
    memur_id NUMBER NOT NULL,
    urun_id NUMBER NOT NULL,
    firma_id NUMBER NOT NULL,
    FOREIGN KEY (plaka) REFERENCES araclar(plaka),
    FOREIGN KEY (memur_id) REFERENCES memurlar(memur_id),
    FOREIGN KEY (urun_id) REFERENCES urun(urun_id),
    FOREIGN KEY (firma_id) REFERENCES firmalar(firma_id)
);