-- SQL BOOTCAMP İKİNCİ HAFTA ÖDEV SORULARI -  ♣ Solved by from Eren ILERI ♣ 

-- 1. Amaç
-- Turkstudentco’da veri bilimci olarak ilk gününüzde, size Chinook veritabanından Invoice tablosu verildi. 
-- Bu tabloyu inceledikten sonra kafanızda birkaç soru oluştu ve bu soruları cevaplamak için SQL sorguları yazmanız istendi. 
-- Bu ödevin amacı, veritabanı sorgulama becerilerinizi geliştirmek ve farklı SQL işlemlerini uygulamanızı sağlamaktır.

-- Table
Select * from invoice;

-- Sorular

-- 1. Invoice tablosunda, tüm değerleri NULL olan kayıtların sayısını bulmanız isteniyor. √ 

-- TABLODA "NULL " OLAN BÜTÜN DEĞERLERİ BULAN SORGU 
SELECT  Count(*) from invoice
where (
Invoice_id is null or
customer_id is null or 
invoice_date is null or
billing_address is null or 
billing_city is null or 
billing_state is null or 
billing_country is null or 
billingpostal_code is null or 
total is null) ; -- Total 209 

-- TABLODA BÜTÜN SATIRLARI "NULL" OLAN DEĞERLERİ BULAN SORGU 
SELECT  Count(*) from invoice
where (
Invoice_id is null and
customer_id is null and 
invoice_date is null and
billing_address is null and
billing_city is null and
billing_state is null and 
billing_country is null and 
billingpostal_code is null and 
total is null) -- Total 0 

-- 2. Koordinasyondaki kişiler, Total değerlerinde bir hata olduğunu belirtiyorlar. √
-- Bu değerlerin iki katını görmek ve eski versiyonlarıyla birlikte karşılaştırmak için bir sorgu yazmanız isteniyor. √
-- Ayrıca, verilerin daha rahat takip edilebilmesi için, tablonun yeni versiyonuna ait kolona göre büyükten küçüğe sıralama yapılması isteniyor.

SELECT total AS OLD_TOTAL, total * 2  AS NEW_TOTAL 
FROM Invoice ORDER BY 2 DESC ;


-- 3. Adres kolonundaki verileri, soldan 3 karakter ve sağdan 4 karakter alarak birleştirmeniz ve "Açık Adres" olarak yazmanız isteniyor. 
-- Ayrıca, bu yeni açık adresi 2013 yılı ve 8. ay’a göre filtrelemeniz gerekiyor.

SELECT billing_address ,invoice_date,
CONCAT (LEFT (billing_address,3 ),' ',RIGHT (billing_address,4)) AS "Açık Adres"
FROM Invoice 
WHERE  TO_CHAR(invoice_date, 'YYYY-MM') = '2013-08' ;


-- Teşekkürler 


