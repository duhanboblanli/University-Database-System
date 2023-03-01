/*
already run

INSERT INTO faculty_member (p_id, f_name, l_name, address,phone,d_code,e_office,msc,phd)
VALUES
(1, 'professor f_name', 'professor l_name', 'professor address', '555-555-555', 1, 'professor e_office', 'professor msc', 'professor phd');
 
INSERT INTO instructor (p_id, prof_type)
VALUES
(12, 'ASSISTANT PROFESSOR');
 
INSERT INTO research_assistant(p_id)
VALUES
(13);
*/

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