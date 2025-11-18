CREATE TABLE `T1students` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL,
    `lastName` VARCHAR(30) NOT NULL,
    `birthday` DATE NULL
);

INSERT INTO `T1students`(`name`,`lastName`,`birthday`) VALUES 
    ('Иван','Иванов','2003-09-21'),
    ('Степан','Разин','2005-12-31'),
    ('Мария','Петрова','2004-03-15'),
    ('Алексей','Сидоров','2002-07-08'),
    ('Ольга','Кузнецова','2003-11-25'),
    ('Дмитрий','Попов','2005-05-30'),
    ('Екатерина','Васильева','2004-08-12'),
    ('Сергей','Смирнов','2002-12-03'),
    ('Анна','Федорова','2003-02-18'),
    ('Павел','Николаев','2005-10-07');

CREATE TABLE `T1subjects` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL,
    `hours` SMALLINT NULL
);

INSERT INTO `T1subjects` (`name`,`hours`) VALUES
    ('математика',170),
    ('русский язык',170),
    ('география',34),
    ('история',68),
    ('физкультура',106);

CREATE TABLE `T1marks` (
    `stud_id` INT,
    `subj_id` INT,
    `ddate` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `mark` TINYINT CHECK (`mark` > 1 and `mark` <= 5),
    FOREIGN KEY (`stud_id`) REFERENCES `T1students` (`id`),
    FOREIGN KEY (`subj_id`) REFERENCES `T1subjects` (`id`)
);

INSERT INTO `T1marks` (`stud_id`,`subj_id`,`ddate`,`mark`) VALUES
    (3, 2, '2025-10-10 08:45:00', 5),
    (1, 1, '2025-10-10 09:00:00', 5),
    (5, 4, '2025-10-11 10:00:00', 2),
    (2, 1, '2025-10-11 11:00:00', 3),
    (1, 2, '2025-10-12 10:30:00', 4),
    (4, 3, '2025-10-12 13:20:00', 4),
    (6, 5, '2025-10-13 14:45:00', 5),
    (2, 4, '2025-10-13 15:30:00', 4),
    (3, 5, '2025-10-14 12:15:00', 3),
    (10, 5, '2025-10-14 13:35:00', 3),
    (8, 3, '2025-10-14 15:00:00', 4),
    (7, 1, '2025-10-15 11:30:00', 3),
    (1, 3, '2025-10-15 14:00:00', 5),
    (9, 2, '2025-10-16 13:00:00', 5),
    (4, 1, '2025-10-16 16:00:00', 5),
    (5, 2, '2025-10-17 09:30:00', 4),
    (10, 2, '2025-10-17 10:20:00', 2);
