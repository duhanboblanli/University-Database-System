DROP DATABASE IF EXISTS university_db_schema;    
CREATE SCHEMA university_db_schema;
 
USE university_db_schema;
 
CREATE TABLE university_db_schema.dept (
   d_code INT PRIMARY KEY,
   d_name VARCHAR(255) NOT NULL,
   d_country VARCHAR(255) NOT NULL,
   d_office VARCHAR(255) NOT NULL,
   d_phone VARCHAR(255) NOT NULL,
   admin_col_name VARCHAR(255) NOT NULL,
   chair_id INT NOT NULL,
   chair_start_date DATE NOT NULL
);
 
CREATE TABLE university_db_schema.faculty_member (
   p_id INT PRIMARY KEY,
   f_name VARCHAR(255) NOT NULL,
   l_name VARCHAR(255) NOT NULL,
   address VARCHAR(255) NOT NULL,
   phone VARCHAR(15) NOT NULL,
   d_code INT NOT NULL,
   e_office VARCHAR(50) NOT NULL,
   msc VARCHAR(255),
   phd VARCHAR(255)
);
 
CREATE TABLE university_db_schema.prof_types (
   prof_type VARCHAR(45) PRIMARY KEY
);
INSERT INTO university_db_schema.prof_types(prof_type)
VALUES ('PROFESSOR'), ('ASSOCIATE PROFESSOR'), ('ASSISTANT PROFESSOR');
 
CREATE TABLE university_db_schema.instructor (
   p_id INT PRIMARY KEY,
   prof_type VARCHAR(45) NOT NULL
);
 
CREATE TABLE university_db_schema.college (
   c_name VARCHAR(255) PRIMARY KEY,
   c_office VARCHAR(255) NOT NULL,
   c_phone VARCHAR(255) NOT NULL,
   dean_id INT NOT NULL
);
 
CREATE TABLE university_db_schema.curriculum (  
  cu_id INT PRIMARY KEY,
  followed_by_deptCode INT NOT NULL
);
 
CREATE TABLE university_db_schema.course (
   c_code INT PRIMARY KEY,
   co_name VARCHAR(255) NOT NULL,
   credits INT NOT NULL,
   course_level INT NOT NULL,
   c_desc VARCHAR(255) NOT NULL,
   in_curriculum INT NOT NULL
);
 
CREATE TABLE university_db_schema.course_keyword (
   c_code INT,
   keyword VARCHAR(100),
   PRIMARY KEY (c_code, keyword)
);
 
CREATE TABLE university_db_schema.mandatory_course (
   c_code INT PRIMARY KEY
);
 
CREATE TABLE university_db_schema.optional_course (
   c_code INT PRIMARY KEY,
   is_technical BOOLEAN NOT NULL
);
 
CREATE TABLE university_db_schema.student (
   p_id INT PRIMARY KEY,
   f_name VARCHAR(255) NOT NULL,
   l_name VARCHAR(255) NOT NULL,
   address VARCHAR(255) NOT NULL,
   phone VARCHAR(15) NOT NULL,
   d_code INT NOT NULL,
   major VARCHAR(100) NOT NULL,
   dob DATE NOT NULL
);
 
CREATE TABLE university_db_schema.student_takes_section (
   p_id INT NOT NULL,
    sec_id INT NOT NULL,
    grade INT,
    PRIMARY KEY(p_id, sec_id)
);
 
CREATE TABLE university_db_schema.fac_mem_research_areas (
   p_id INT NOT NULL,
    research_area VARCHAR(100) NOT NULL,
    PRIMARY KEY (p_id, research_area)
);
 
CREATE TABLE university_db_schema.research_assistant (
   p_id INT PRIMARY KEY
);
 
CREATE TABLE university_db_schema.section (
   sec_id INT PRIMARY KEY,
   sec_no INT NOT NULL,
   bldg VARCHAR(100) NOT NULL,
   room_no INT NOT NULL,
   DaysTime VARCHAR(100) NOT NULL,
   sec_year YEAR NOT NULL,
   sem VARCHAR(15) NOT NULL,
   c_code INT NOT NULL,
   instr_p_id INT NOT NULL
);
 
CREATE TABLE university_db_schema.research_assistant_assists_section (
   p_id INT NOT NULL,
   sec_id INT NOT NULL,
   PRIMARY KEY(p_id, sec_id)
);
 
ALTER TABLE dept
ADD FOREIGN KEY (admin_col_name) REFERENCES college(c_name),
ADD FOREIGN KEY (chair_id)REFERENCES instructor(p_id);
 
ALTER TABLE faculty_member
ADD FOREIGN KEY (d_code) REFERENCES dept(d_code);
 
ALTER TABLE instructor
ADD FOREIGN KEY (prof_type) REFERENCES prof_types(prof_type),
ADD FOREIGN KEY (p_id) REFERENCES faculty_member(p_id);
 
ALTER TABLE college
ADD FOREIGN KEY (dean_id) REFERENCES instructor(p_id);
 
ALTER TABLE course
ADD FOREIGN KEY (in_curriculum) REFERENCES curriculum(cu_id);
 
ALTER TABLE mandatory_course
ADD FOREIGN KEY (c_code) REFERENCES course(c_code);
 
ALTER TABLE optional_course
ADD FOREIGN KEY (c_code) REFERENCES course(c_code);
 
ALTER TABLE student
ADD FOREIGN KEY (d_code) REFERENCES dept(d_code);
 
ALTER TABLE student_takes_section
ADD FOREIGN KEY (p_id) REFERENCES student(p_id),
ADD FOREIGN KEY (sec_id) REFERENCES section(sec_id);
 
ALTER TABLE fac_mem_research_areas
ADD FOREIGN KEY (p_id) REFERENCES faculty_member(p_id);
 
ALTER TABLE research_assistant
ADD FOREIGN KEY (p_id) REFERENCES faculty_member(p_id);
 
ALTER TABLE course_keyword
ADD FOREIGN KEY (c_code) REFERENCES course(c_code);
 
ALTER TABLE section
ADD FOREIGN KEY (c_code) REFERENCES course(c_code),
ADD FOREIGN KEY (instr_p_id) REFERENCES instructor(p_id);
 
ALTER TABLE research_assistant_assists_section
ADD FOREIGN KEY (p_id) REFERENCES faculty_member(p_id),
ADD FOREIGN KEY (sec_id) REFERENCES section(sec_id);
 
#1,2,3… kursun toplam kaç keywordu var hesaplar 
CREATE VIEW university_db_schema.keyword_count_table
AS
SELECT c_code, count(*) as keyword_count
FROM course_keyword
GROUP BY c_code;
 
# lists match rates between instructor and course and then order them
CREATE VIEW university_db_schema.instructor_matches_course (Course, Instructor_Id, Match_Rate)
AS
(
   SELECT Course, Instructor_Id, match_count / keyword_count as Match_Rate
   FROM
         (  SELECT c_code as Course, p_id as Instructor_Id, COUNT(*) as match_count
            FROM fac_mem_research_areas JOIN course_keyword ON keyword = research_area
            GROUP BY p_id, c_code
         ) as temp_table
         JOIN
         keyword_count_table
         ON Course = c_code
   ORDER BY c_code ASC, Match_Rate DESC
);
