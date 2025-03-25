-- 1.Soru: “USA” ülkesine ait, 2009 yılı içerisinde oluşturulmuş tüm faturaların (Invoice) toplamını listeleyen bir sorgu yazınız.
	
	-- 1. Adım 
		
		SELECT invoice_date, billing_country, total FROM invoice; 
	
	-- 2. Adım
	
		SELECT  invoice_date,Billing_country,total FROM invoice                 
		WHERE TO_CHAR(invoice_date, 'YYYY') = '2009' AND Billing_country='USA';

	-- Son adım 

		SELECT  SUM(total) FROM invoice                 
		WHERE TO_CHAR(invoice_date, 'YYYY') = '2009' AND Billing_country='USA';

-- 2.Soru: Tüm parça (track) bilgilerini, bu parçaların ait olduğu playlisttrack ve playlist tablolarıyla birleştirerek (JOIN) listeleyen bir sorgu yazınız.
	
	-- 1. Adım 
		
		SELECT * FROM 	Track;
		SELECT * FROM   Playlisttrack;
		SELECT * FROM 	Playlist;

	-- 2. Adım 

		SELECT 
		t.track_id, t.name AS TR_NAME, t.album_id, t.mediatype_id, t.genre_id, t.composer, t.milliseconds, t.bytes, t.unitprice, pt.playlist_id
		FROM Track AS t
		LEFT JOIN playlisttrack AS pt ON pt.track_id = t.track_id;

	-- Son Adım

		SELECT 
		t.track_id, t.name AS TR_NAME, t.album_id, t.mediatype_id, t.genre_id, t.composer, t.milliseconds, t.bytes, t.unitprice, pt.playlist_id, pl.name AS playlist_name
		FROM Track AS t
		LEFT JOIN playlisttrack AS pt ON pt.track_id = t.track_id
		LEFT JOIN Playlist AS pl ON pl.playlist_id = pt.playlist_id;

-- 3.Soru: "Let There Be Rock" adlı albüme ait tüm parçaları (Track) listeleyen, sanatçı (Artist) bilgisini de içeren bir sorgu yazınız. Ayrıca, sonuçları parça süresi (milliseconds) büyükten küçüğe sıralayınız.

	-- 1. Adım 

		SELECT * FROM Album;
		SELECT * FROM Track;
		Select * from artist; 
	-- 2. Adım 

		SELECT t.name AS Track_NAME, t.album_id, t.composer, t.milliseconds, a.title,ar.name 
		FROM track AS t 
		LEFT JOIN album AS a ON a.album_id= t.album_id
		LEFT JOIN artist AS ar ON ar.artist_id=a.artist_id
		WHERE a.title = 'Let There Be Rock';
	-- Son Adım
	
		SELECT t.name AS Track_NAME, t.album_id, t.composer, t.milliseconds, a.title,ar.name 
		FROM track AS t 
		LEFT JOIN album AS a ON a.album_id= t.album_id
		LEFT JOIN artist AS ar ON ar.artist_id=a.artist_id
		WHERE a.title = 'Let There Be Rock'
		ORDER BY  t.milliseconds DESC;
	
		


