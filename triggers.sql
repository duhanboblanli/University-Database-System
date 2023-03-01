CREATE TABLE STUDENT_LOGS (
    message VARCHAR(100) ,
    id INT AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER Section_population_del BEFORE DELETE ON student_takes_section
FOR EACH ROW
BEGIN
	IF EXISTS(
		SELECT COUNT(*)
		FROM student_takes_section
		GROUP BY sec_id
		HAVING COUNT(*) <= 5
	)
    THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Section must have at least 5 students. Cannot perform this delete command.'; 
    END IF;
END$$   
DELIMITER ;

DELIMITER //
CREATE TRIGGER log_student_ins AFTER INSERT ON STUDENT
FOR EACH ROW BEGIN
  INSERT INTO student_logs (message) VALUES (" New student added.");
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER log_dept_ins AFTER INSERT ON dept
FOR EACH ROW BEGIN
  INSERT INTO student_logs (message) VALUES ("New dept was added. Inform the department chair.");
END;
//
DELIMITER ;
