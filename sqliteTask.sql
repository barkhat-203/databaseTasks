--sqlite3 db_0203.db

CREATE TABLE IF NOT EXISTS `group`(
'id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
'gr' VARCHAR NOT NULL,
'sp' VARCHAR NOT NULL,
'year_n' INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS `student` (
'id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
'fam' VARCHAR,
'name' VARCHAR NOT NULL,
'year_b' INTEGER NOT NULL,
'gr_id' INTEGER NOT NULL,
FOREIGN KEY ('gr_id') REFERENCES `group`('id')
);

ALTER TABLE `group` DROP COLUMN 'sp';
ALTER TABLE `group` ADD COLUMN 'sp_code' VARCHAR; 

CREATE TABLE IF NOT EXISTS `speciality` (
'code' VARCHAR PRIMARY KEY NOT NULL UNIQUE,
'name' VARCHAR NOT NULL
);

--since we can't add foreign keys to an existing table
DROP TABLE IF EXISTS `group`;

CREATE TABLE IF NOT EXISTS `group`(
'id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
'gr' VARCHAR NOT NULL,
'sp_code' VARCHAR NOT NULL,
'year_n' INTEGER NOT NULL,
FOREIGN KEY ('sp_code') REFERENCES `speciality`('code')
);

INSERT INTO `speciality` ('code', 'name') VALUES
('09.03.01', 'Информатика и вычислительная техника'),
('09.03.04', 'Программная инженерия'),
('38.03.05', 'Бизнес-информатика'),
('01.03.02', 'Прикладная математика и информатика'),
('09.03.02', 'Информационные системы и технологии'),
('10.03.01', 'Информационная безопасность');

INSERT INTO `group` ('gr', 'sp_code', 'year_n') VALUES
('ИВТ-101', '09.03.01', 2023),
('ПИ-101', '09.03.04', 2023),
('БИ-101', '38.03.05', 2023),
('ПМИ-101', '01.03.02', 2023),
('ИВТ-201', '09.03.01', 2022),
('ПИ-201', '09.03.04', 2022);

INSERT INTO `student` ('fam', 'name', 'year_b', 'gr_id') VALUES
('Иванов', 'Иван', 2004, 1),
('Петрова', 'Мария', 2004, 1),
('Сидоров', 'Алексей', 2005, 1),
('Кузнецова', 'Анна', 2004, 1),
('Смирнов', 'Дмитрий', 2004, 2),
('Васильева', 'Елена', 2005, 2),
('Попов', 'Михаил', 2004, 2),
('Новикова', 'Ольга', 2004, 2),
('Федоров', 'Сергей', 2004, 3),
('Морозова', 'Татьяна', 2004, 3),
('Волков', 'Андрей', 2005, 3),
('Алексеева', 'Ирина', 2004, 3),
('Лебедев', 'Павел', 2004, 4),
('Козлова', 'Наталья', 2005, 4),
('Егоров', 'Александр', 2004, 4),
('Орлов', 'Владимир', 2003, 5),
('Антонова', 'Светлана', 2003, 5),
('Макаров', 'Игорь', 2003, 5),
('Захаров', 'Роман', 2003, 6),
('Зайцева', 'Юлия', 2003, 6),
('Семенов', 'Артем', 2002, 6);

UPDATE `student` SET year_b=2003 WHERE id=1;

DELETE FROM `student` WHERE id=10;

SELECT * FROM `student` s WHERE s.gr_id = (SELECT g.id FROM `group` g WHERE g.gr = 'ПМИ-101');

SELECT * FROM `student` s WHERE s.gr_id IN (SELECT g.id FROM `group` g WHERE g.sp_code LIKE '09%');