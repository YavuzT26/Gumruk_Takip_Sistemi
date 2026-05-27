# 🚛 Edirne Sınır Kapıları Gümrük Takip Sistemi

Bu proje Edirne Sınır Kapılarını kapsayan bir Veri Tabanı Yönetim Sistemleri (VTYS) projesidir. 

Uluslararası ticaret, lojistik araç trafiği ve sınır kapısı kontrol süreçlerini dijitalleştirmek amacıyla tasarlanmış kapsamlı bir ilişkisel veritabanı (RDBMS) şemasıdır.
Oracle SQL (FreeSQL) standartlarına uygun olarak geliştirilen bu sistem; gerçek dünya senaryolarına dayanarak araç geçişlerini, ürün risk analizlerini ve gümrük memuru onay/red süreçlerini simüle eder.


## 🏗️ Veritabanı Mimarisi

Veritabanı, 4 ana modül ve birbiriyle tam ilişkili 10 tablodan oluşmaktadır:

1. **İşlem Modülü (Merkez):** `beyanname` tablosu sistemin kalbidir. Her bir geçiş işlemi; araç, personel, ürün, firma, parasal değer ve işlemin sonucu (Onay/Red) ile birlikte burada tutulur.
2. **Ürün ve Şirket Yönetimi:** `urun_tipleri`, `urun`, `firmalar` (Ürünler sektörlere ayrılmış ve 0-5 arası risk dereceleriyle sınıflandırılmıştır).
3. **Sınır ve Personel Yönetimi:** `kapi_tipleri`, `sinir_kapilari`, `memurlar` (Kapıkule, İpsala, Hamzabeyli vb. gerçek sınır kapıları ve personelleri).
4. **Araç ve Lojistik Yönetimi:** `ulkeler`, `arac_tipleri`, `araclar` (Farklı araç tipleri ve uluslararası plaka/menşei kodlamaları).

## 🚀 Kullanılan Teknolojiler ve SQL Özellikleri

* **Dialect:** Oracle SQL / PostgreSQL standartları (Oracle FreeSQL ortamında test edilmiştir).
* **Veri Bütünlüğü (Data Integrity):** `PRIMARY KEY` ve `FOREIGN KEY` ilişkileri.
* **Otomatik Artan Kimlikler:** `GENERATED ALWAYS AS IDENTITY` yapısı ile sekans yönetimi.
* **Kısıtlamalar (Constraints):** `CHECK` constraint'leri ile hatalı veri girişi engelleme (Örn: Beyanname sonucu sadece 'Onay' veya 'Red' olabilir).
