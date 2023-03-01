# unoriginal SELECT statements

# use one table
SELECT dean_id
FROM college
WHERE c_name = "deneme college";
 
SELECT *
FROM course
WHERE credits > 3;
 
SELECT *
FROM curriculum;

# use two table

SELECT *
FROM dept d, curriculum cu
WHERE cu.followed_by_deptCode = d.d_code;
 
SELECT *
FROM course NATURAL JOIN course_keyword;
 
SELECT *
FROM college JOIN dept ON college.c_name = dept.admin_col_name;
 
SELECT *
FROM research_assistant NATURAL JOIN research_assistant_assists_section;

# use three tables

SELECT *
FROM college co, dept d, curriculum cu
WHERE co.c_name = d.admin_col_name AND cu.followed_by_deptCode = d.d_code;
 
SELECT c.c_code, count(*)
FROM course c NATURAL JOIN section NATURAL JOIN student_takes_section
GROUP BY c.c_code;
 
SELECT *
FROM faculty_member f, dept d, college c
WHERE f.d_code = d.d_code AND d.admin_col_name=c.c_name;

# original SELECT statements

#avg number of research areas per instructor type
SELECT instr.prof_type, count(*) / count(distinct instr.p_id) AS "Average Number of Research Areas"
FROM fac_mem_research_areas ra NATURAL JOIN instructor instr NATURAL JOIN faculty_member fm
GROUP BY instr.prof_type
ORDER BY count(distinct instr.p_id)/count(*);

# Müfredat numarası 1'e kayıtlı olan ve zorunlu alınması gereken derslerden o derse özel toplam keyword sayısına ve o dersin açıklamasına ulaşılmak istenmiştir.
SELECT C.c_code, K.in_curriculum,  count(*) as keyword_count, c_desc
FROM course_keyword AS C,mandatory_course AS M , course AS K
WHERE C.c_code = M.c_code AND C.c_code = K.c_code AND K.in_curriculum = "1"
GROUP BY C.c_code;

# 2022 yılında 1 numaralı sectionı alan öğrencilerden ders notlarına göre ortalamada ilk 3'e girenlere ödül verilmek üzere adresleri öğrenilmek istenmiştir.
SELECT S.p_id,S.sec_id, AVG(S.p_id) AS Average_Grade, U.address
FROM student_takes_section AS S,section AS K, student AS U
WHERE S.sec_id = "1" AND K.sec_year = "2022" AND S.p_id = U.p_id AND s.sec_id = k.sec_id
GROUP BY S.p_id,S.sec_id 
ORDER BY AVG(S.p_id) DESC
LIMIT 3;

# Yüksek lisans ve doktora tezi olan faculty memberların yanına 1, diğerlerinin yanına 0 yazdır
SELECT FM.f_name,
  CASE
    WHEN FM.phd IS NOT NULL AND FM.phd IS NOT NULL THEN 1
    ELSE 0
  END as has_theses
FROM university_db_schema.faculty_member AS FM;

# Kredisi 5 veya daha fazla olan derslere 1, diğerlerinin yanına 0 yazdır
SELECT C.co_name,
  CASE
    WHEN C.credits >= 5 THEN 1
    ELSE 0
  END as has_credits_greater_than_4
FROM course AS C;
