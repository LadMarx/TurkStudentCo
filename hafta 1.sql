-- A ->Beklirli kolonları getirilmesi komutu. 
Select first_name, last_name, salary from Employees;
-- Bu sorguda yalnızca istenilen değerlerin dönmesi için select ile from arasına virgüllerle ifade edilmiş kolonlar dönmektedir. Bu kolonlar harici diğer kolonlar çağırılmamaktadır. 

-- B -> DISTINCT Komutu ile Tekrarları Önleme
Select DISTINCT Department_name 
from Departments; 
-- Bu sorgu ile elemanların çalıştıkları (sadece başlık olarak) isimleri listelenir. Distinct ifadesi ile sadece benzersiz değerler döndürülür.

-- C -> Belirli Bir Departmana Ait Çalışanları Listeleme
Select * 
From employees 
WHERE department_id='6'
-- Bu kodu ben kendim yazdım mantığı şu yönde; İlk önce IT departmana karşılık gelen idyi buldum ondan sonra departman idsi buna eşit olan elemanları getir dedim. 

-- D -> Maaşa Göre Sıralama
 Select * from employees order by salary desc;
-- Employees tablosundaki çalışanların maaşlarnı büyükten küçüğe göre sıralama sorgusu. 

-- E -> Kolonları Birleştirme (Concatenation)

Select First_name || ' ' || Last_name 
as Emloyeees_full_name 
from employees ;

-- Bu sorgu çalışanların tam isimlerini göstermemizi sağlar. 

