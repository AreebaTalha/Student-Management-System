-- Create database
CREATE DATABASE IF NOT EXISTS school;
USE school;

-- Create tables
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50)
);

CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50),
    teacher_id INT
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    class_id INT
);

CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT
);

-- Insert Teachers FIRST
INSERT INTO Teachers (teacher_id, name, subject) VALUES
(101, 'Mr. Khan', 'Math'),
(102, 'Ms. Fatima', 'Science'),
(103, 'Mr. Bilal', 'English');

-- Insert Classes SECOND
INSERT INTO Classes (class_id, class_name, teacher_id) VALUES
(1, 'Class 10', 101),
(2, 'Class 9', 102),
(3, 'Class 8', 103);

-- Insert Students THIRD
INSERT INTO Students (student_id, name, age, gender, class_id) VALUES
(1, 'Ahmed', 17, 'Male', 1),
(2, 'Sara', 18, 'Female', 2),
(3, 'Ali', 19, 'Male', 1),
(4, 'Ayesha', 17, 'Female', 3),
(5, 'Usman', 21, 'Male', 2),
(6, 'Zara', 22, 'Female', 3),
(7, 'Hassan', 20, 'Male', 1);

-- Insert Marks LAST
INSERT INTO Marks (mark_id, student_id, subject, marks) VALUES
(1, 1, 'Math', 88),
(2, 2, 'Science', 75),
(3, 3, 'Math', 90),
(4, 4, 'English', 65),
(5, 5, 'Science', 95),
(6, 6, 'English', 85),
(7, 7, 'Math', 72),
(8, 1, 'Science', 70),
(9, 2, 'Math', 67),
(10, 4, 'Math', 78);
SELECT name FROM Students;
SELECT name FROM Students
WHERE gender = 'Male';
SELECT * FROM Students
WHERE age > 18;
SELECT * FROM Students
WHERE class_id = 2;
SELECT * FROM Students
ORDER BY age ASC;
SELECT student_id, marks
FROM Marks
WHERE subject = 'Math'
ORDER BY marks DESC
LIMIT 5;
SELECT S.name AS student_name, C.class_name
FROM Students S
JOIN Classes C ON S.class_id = C.class_id;
SELECT S.name AS student_name, T.name AS teacher_name
FROM Students S
JOIN Classes C ON S.class_id = C.class_id
JOIN Teachers T ON C.teacher_id = T.teacher_id;
SELECT subject, AVG(marks) AS average_marks
FROM Marks
GROUP BY subject;
SELECT class_id, COUNT(*) AS total_students
FROM Students
GROUP BY class_id;
SELECT MAX(marks) AS highest_science_marks
FROM Marks
WHERE subject = 'Science';
SELECT S.name, M.marks
FROM Marks M
JOIN Students S ON M.student_id = S.student_id
WHERE M.marks > (
    SELECT AVG(marks) FROM Marks
);
SELECT C.class_name
FROM Students S
JOIN Classes C ON S.class_id = C.class_id
ORDER BY S.age DESC
LIMIT 1;
INSERT INTO Students (student_id, name, age, gender, class_id)
VALUES (8, 'Ali', 17, 'Male', 3);
UPDATE Teachers
SET subject = 'Computer Science'
WHERE teacher_id = 1;
SELECT name FROM Students
WHERE student_id NOT IN (
  SELECT student_id FROM Marks
  WHERE subject = 'English'
);
SELECT C.class_name,
       SUM(CASE WHEN S.gender = 'Male' THEN 1 ELSE 0 END) AS male_count,
       SUM(CASE WHEN S.gender = 'Female' THEN 1 ELSE 0 END) AS female_count
FROM Students S
JOIN Classes C ON S.class_id = C.class_id
GROUP BY C.class_name;
SELECT S.name, SUM(M.marks) AS total_marks
FROM Students S
JOIN Marks M ON S.student_id = M.student_id
GROUP BY S.name
ORDER BY total_marks DESC;
CREATE TEMPORARY TABLE StudentTeacherInfo AS
SELECT S.name AS student_name, T.name AS teacher_name
FROM Students S
JOIN Classes C ON S.class_id = C.class_id
JOIN Teachers T ON C.teacher_id = T.teacher_id;





