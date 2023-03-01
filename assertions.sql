#research_assistant - instructor
DELIMITER $$
CREATE TRIGGER research_assistant_trig_ins BEFORE INSERT
ON research_assistant
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM instructor
        WHERE NEW.p_id = instructor.p_id
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'INSERT WARNING - RESEARCH ASSISTANT EXISTS IN INSTRUCTOR TABLE';
    END IF;
END$$  
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER research_assistant_trig_upd BEFORE UPDATE
ON research_assistant
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM instructor
        WHERE NEW.p_id = instructor.p_id
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'UPDATE WARNING - RESEARCH ASSISTANT EXISTS IN INSTRUCTOR TABLE';
    END IF;
END$$  
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER instructor_ins BEFORE INSERT
ON instructor
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM research_assistant
        WHERE NEW.p_id = research_assistant.p_id
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'INSERT WARNING - INSTRUCTOR EXISTS IN RESEARCH_ASSISTANT TABLE';
    END IF;
END$$  
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER instructor_upd BEFORE UPDATE
ON instructor
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM research_assistant
        WHERE NEW.p_id = research_assistant.p_id
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'UPDATE WARNING - INSTRUCTOR EXISTS IN RESEARCH_ASSISTANT TABLE';
    END IF;
END$$  
DELIMITER ;
 
# mandatory - optional
DELIMITER $$
CREATE TRIGGER mandatory_ins BEFORE INSERT
ON mandatory_course
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM optional_course
        WHERE NEW.c_code = optional_course.c_code
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'INSERT WARNING - COURSE EXISTS IN OPTIONAL COURSE TABLE';
    END IF;
END$$  
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER mandatory_upd BEFORE UPDATE
ON mandatory_course
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM optional_course
        WHERE NEW.c_code = optional_course.c_code
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'UPDATE WARNING - COURSE EXISTS IN OPTIONAL COURSE TABLE';
    END IF;
END$$  
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER optional_ins BEFORE INSERT
ON optional_course
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM mandatory_course
        WHERE NEW.c_code = mandatory_course.c_code
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'INSERT WARNING - COURSE EXISTS IN MANDATORY COURSE TABLE';
    END IF;
END$$  
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER optional_upd BEFORE UPDATE
ON optional_course
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM mandatory_course
        WHERE NEW.c_code = mandatory_course.c_code
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'UPDATE WARNING - COURSE EXISTS IN MANDATORY COURSE TABLE';
    END IF;
END$$  
DELIMITER ;
 
# faculty_member - student
DELIMITER $$
CREATE TRIGGER faculty_member_ins BEFORE INSERT
ON faculty_member
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM student
        WHERE NEW.p_id = student.p_id
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'INSERT WARNING - FACULTY MEMBER EXISTS IN STUDENT TABLE';
    END IF;
END$$  
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER faculty_member_upd BEFORE UPDATE
ON faculty_member
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM student
        WHERE NEW.p_id = student.p_id
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'UPDATE WARNING - FACULTY MEMBER EXISTS IN STUDENT TABLE';
    END IF;
END$$  
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER student_ins BEFORE INSERT
ON student
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM faculty_member
        WHERE NEW.p_id = faculty_member.p_id
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'INSERT WARNING - STUDENT EXISTS IN FACULTY MEMBER TABLE';
    END IF;
END$$  
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER student_upd BEFORE UPDATE
ON student
FOR EACH ROW
BEGIN
    IF EXISTS(
        SELECT *
        FROM faculty_member
        WHERE NEW.p_id = faculty_member.p_id
    )
    THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'UPDATE WARNING - STUDENT EXISTS IN FACULTY MEMBER TABLE';
    END IF;
END$$  
DELIMITER ;
