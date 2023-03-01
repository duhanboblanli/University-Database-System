SET foreign_key_checks = 0;
 
INSERT INTO dept (d_code, d_name, d_country, d_office, d_phone, admin_col_name, chair_id, chair_start_date)
VALUES
(1, 'Department of Computer Science', 'Turkiye', 'dept 1 d office', '123-123-123', 'deneme college', 1, '2022-12-26'),
(2, 'Department of Artificial Intelligence', 'Turkiye', 'dept 2 d office', '444-555-666', 'deneme2 college', 2, '2020-11-11'),
(3, 'Department of Software Engineering ', 'Turkiye', 'dept 3 d office', '111-555-666', 'deneme3 college', 3, '1999-11-11');
 
INSERT INTO faculty_member (p_id, f_name, l_name, address,phone,d_code,e_office,msc,phd)
VALUES
(1, 'professor f_name', 'professor l_name', 'professor address', '555-555-555', 1, 'professor e_office', 'professor msc', 'professor phd'),
(2, 'associate professor f_name', 'associate professor l_name', 'associate professor address', '444-444-444', 1, 'associate professor e_office', 'associate professor msc', 'associate professor phd'),
(3, 'assistant professor f_name', 'assistant professor l_name', 'assistant professor address', '333-333-333', 1, 'assistant professor e_office', 'assistant professor msc', 'assistant professor phd'),
(4, 'research assistant f_name', 'research assistant l_name', 'research assistant address', '111-111-111', 1, 'research assistant e_office', 'research assistant msc', 'research assistant phd'),
(10, 'professor2 f_name', 'professor2 l_name', 'professor2 address', '222-555-555', 2, 'professor2 e_office', 'professor msc', 'professor phd'),
(11, 'associate professor2 f_name', 'associate professor2 l_name', 'associate professor2 address', '222-444-444', 2, 'associate professor2 e_office', 'associate professor2 msc', 'associate professor2 phd'),
(12, 'assistant professor2 f_name', 'assistant professor2 l_name', 'assistant professor2 address', '222-333-333', 3, 'assistant professor2 e_office', 'assistant professor2 msc', 'assistant professor2 phd'),
(13, 'research assistant2 f_name', 'research assistant2 l_name', 'research assistant2 address', '222-111-111', 3, 'research assistant2 e_office', 'research assistant2 msc', null);
 
INSERT INTO instructor (p_id, prof_type)
VALUES
(1, 'PROFESSOR'),
(2, 'ASSOCIATE PROFESSOR'),
(3, 'ASSISTANT PROFESSOR'),
(10, 'PROFESSOR'),
(11, 'ASSOCIATE PROFESSOR'),
(12, 'ASSISTANT PROFESSOR');
 
INSERT INTO research_assistant(p_id)
VALUES
(4),
(13);
 
INSERT INTO college (c_name, c_office, c_phone, dean_id)
VALUES
('deneme college', 'deneme college c office', '555-555-555', 1),
('deneme2 college', 'deneme2 college c office', '111-111-111', 5),
('deneme3 college', 'deneme3 college c office', '222-222-222', 1);
 
INSERT INTO student (p_id, f_name, l_name, address, phone, d_code, major, dob)
VALUES
(5, 'stud1 f_name', 'stud1 l_name', 'stud1 address', '312-312-312', 1, 'Computer Engineering', '2000-01-01'),
(6, 'stud2 f_name', 'stud2 l_name', 'stud2 address', '312-111-312', 1, 'Computer Science', '2000-01-01'),
(7, 'stud3 f_name', 'stud3 l_name', 'stud3 address', '312-312-111', 1, 'Software Engineering', '2000-01-01'),
(8, 'stud4 f_name', 'stud4 l_name', 'stud4 address', '111-312-312', 1, 'Mathematical Computer Science', '2000-02-01'),
(9, 'stud9 f_name', 'stud9 l_name', 'stud9 address', '999-312-312', 2, 'Software Engineering', '2000-02-01'),
(14, 'stud6 f_name', 'stud6 l_name', 'stud6 address', '222-222-312', 1, 'Practical Computer Science', '2000-01-01'),
(15, 'stud7 f_name', 'stud7 l_name', 'stud7 address', '777-312-111', 2, 'Software Engineering', '2000-01-01'),
(16, 'stud8 f_name', 'stud8 l_name', 'stud8 address', '888-312-312', 3, 'Artificial Intelligence', '1999-02-01'),
(17, 'stud9 f_name', 'stud9 l_name', 'stud9 address', '999-222-312', 3, 'Artificial Intelligence', '1998-01-01');
 
INSERT INTO curriculum (cu_id, followed_by_deptCode)
VALUES
(1, 1),
(2, 2),
(3, 3);
 
INSERT INTO course (c_code, co_name, credits, course_level, c_desc, in_curriculum)
VALUES
(1, 'Maths', 5, 1, 'maths desc', 1),
(2, 'Science', 6, 2, 'science desc', 1),
(3, 'Music', 2, 1, 'music desc', 1),
(4, 'Object Oriented Programing', 6, 2, 'OOP desc', 2),
(5, 'Artificial Intelligence', 2, 1, 'AI desc', 3);
 
INSERT INTO mandatory_course (c_code)
VALUES (1),(4),(5);
INSERT INTO optional_course (c_code, is_technical)
VALUES (2, true), (3, false);
 
INSERT INTO section (sec_id, sec_no, bldg, room_no, DaysTime, sec_year, sem, c_code, instr_p_id)
VALUES
(1, 123, 'Building A', 38567, 'MW 11:30 am', 2022, 'Fall', 1, 1),
(2, 123, 'Building B', 13867, 'F 11:30 am', 2022, 'Fall', 2, 2),
(3, 123, 'Building C', 33867, 'M 09:30 am', 2022, 'Fall', 3, 3);
 
INSERT INTO student_takes_section (p_id, sec_id, grade)
VALUES
(5, 1, 78), (5, 2, 78), (5, 3, 78),
(6, 1, 100), (6, 2, 100), (6, 3, 100),
(7, 1, 22), (7, 2, 22), (7, 3, 27),
(8, 1, 71), (8, 2, 71), (8, 3, 71),
(9, 1, 5),
(14, 1, 51), (14, 2, 71), (14, 3, 11),
(15, 1, 61), (15, 2, 21), (15, 3, 22),
(16, 1, 21), (16, 2, 55), (16, 3, 33),
(17, 1, 81), (17, 2, 66), (17, 3, 44);
 
INSERT INTO research_assistant_assists_section (p_id, sec_id)
VALUES (4, 1),(4, 2),(4, 3);
 
SET foreign_key_checks = 1;
 
INSERT INTO course_keyword (c_code, keyword)
VALUES (1, 'kw11'),(1, 'kw12'),(1, 'kw13'),
       (2, 'kw21'),(2, 'kw22'),
       (3, 'kw31'),(3, 'kw32'),(3, 'kw33'),(3, 'kw34'),
       (4, 'kw41'),(1, 'kw42'),(1, 'kw43'),
       (5, 'kw51'),(2, 'kw52');
 
INSERT INTO fac_mem_research_areas (p_id, research_area)
VALUES (1, 'kw11'),(2, 'kw12'),(3, 'kw13'),
       (1, 'kw21'),(3, 'kw22'),(1, 'kw12'),
       (2, 'kw31'),(1, 'kw32'),(4, 'kw33'),(4, 'kw34'),
       (10, 'kw41'),(11, 'kw42'),(12, 'kw43'),(13, 'kw44')
;
 
#UPDATE Statements
UPDATE student
SET d_code = '2', major = 'Software Engineering'
WHERE d_code = '3';
 
UPDATE course_keyword
SET keyword = '53'
WHERE c_code = '5' AND keyword = "kw51";
 
UPDATE fac_mem_research_areas
SET research_area = 'kw45'
WHERE p_id = '10';
 
#DELETE Statements
DELETE FROM student_takes_section WHERE p_id = '17' AND sec_id = '2';
DELETE FROM student_takes_section WHERE p_id = '7'AND grade = '27';
DELETE FROM course_keyword WHERE c_code = '5';
DELETE FROM fac_mem_research_areas WHERE p_id = '10';