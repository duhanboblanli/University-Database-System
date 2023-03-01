ALTER TABLE student_takes_section
ADD CHECK (grade>=0);
 
ALTER TABLE course
ADD CHECK (credits>=0);
 
ALTER TABLE section
ADD CHECK (room_no>=0);
