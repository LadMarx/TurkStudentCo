BEGIN;

CREATE TABLE Members(
	member_id SERIAL PRIMARY KEY,
	member_username VARCHAR(50) NOT NULL UNIQUE,
	member_password VARCHAR(255) NOT NULL ,
	member_email VARCHAR(100) NOT NULL UNIQUE,
	member_name VARCHAR(50) NOT NULL ,
	member_surname VARCHAR(50) NOT NULL,
	member_register_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

SAVEPOINT A1;
CREATE TABLE  Categories(
	Categories_id SMALLSERIAL PRIMARY KEY,
	Categories_name VARCHAR(100) NOT NULL UNIQUE
)

SAVEPOINT A2;

CREATE TABLE Instructor(
	instructor_id SMALLSERIAL PRIMARY KEY ,
	instructor_name VARCHAR(50) NOT NULL,
	instructor_surname VARCHAR(50) NOT NULL
)

SAVEPOINT A3;

CREATE TABLE Courses(
	Course_id SERIAL PRIMARY KEY  ,
	Couse_name VARCHAR(200) NOT NULL,
	Categories_id SMALLINT,
	Couse_description TEXT,
	Couse_startime DATE,
	instructor_id SMALLINT,
	FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id),
	FOREIGN KEY (Categories_id) REFERENCES Categories(Categories_id) 
)
	
SAVEPOINT A4;

CREATE TABLE Enrollments(
	Enrollments_id BIGSERIAL PRIMARY KEY, --bir kişi birden fazla kursa kayıt yapabilir.
	member_id INTEGER NOT NULL,-- Kayıt yapan kişi 
	course_id INTEGER NOT NULL,-- Kayıt yapılan eğitim
	Enrollments_register_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,-- Giriş yaptığı tarihi kayıt tarihi olarak alsın.
	FOREIGN KEY (member_id) REFERENCES Members(member_id),
	FOREIGN KEY (Course_id) REFERENCES Courses(Course_id),-- Çoka - çok ilişki için
	UNIQUE(member_id,course_id) 	-- Fazldan kayıtı engellemek 
)

SAVEPOINT A5;

CREATE TABLE Certificates(
	Certificates_id BIGSERIAL PRIMARY KEY, -- Kayıt yapan herkes mezun olabilir.
	Certificates_code VARCHAR(200) NOT NULL UNIQUE,
	Certificates_DoI DATE DEFAULT CURRENT_DATE, -- Sertifikayı kazandığı an mevcut veriliş zamanı sayılsın.
	course_id INT NOT NULL,
	FOREIGN KEY course_id REFERENCES courses(course_id)
)

SAVEPOINT A6;

CREATE TABLE CertificateAssignments (
    CertificateAssignments_id BIGSERIAL PRIMARY KEY,
    Certificates_id BIGINT NOT NULL,
    Member_id INT NOT NULL,-- hangi kişi olduğu 
    Certificates_DoR DATE DEFAULT CURRENT_DATE,-- Serfikatı teslim aldığı tarih 
    FOREIGN KEY (Certificates_id) REFERENCES Certificates(Certificates_id),
    FOREIGN KEY (Member_id) REFERENCES Members(Member_id)
)

SAVEPOINT A7;

CREATE TABLE BlogPosts(
	post_id BIGSERIAL PRIMARY KEY,
	autor_id INT NOT NULL,
	post_title VARCHAR(255) NOT NULL,
	post_contents TEXT,
	post_DoS TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (autor_id) REFERENCES members(member_id)
)

COMMIT;