# University-Database-System


![Badge](https://img.shields.io/badge/University_Database-System-blue)
![badge](https://img.shields.io/badge/Database_Management-Project-green)
![badge](https://img.shields.io/badge/Language-MySQL-orange)

## Brief Explanation

This Entity Relationship diagram belongs to a database used by a university. There are entities that reflect the real world such as 
COLLEGE, INSTRUCTOR, DEPT, COURSE, SECTION, STUDENT. There are also relationships that these entities have like DEPT 
--> EMPLOYS --> INSTRUCTOR, STUDENT --> TAKES --> SECTION and the minimum and maximum number of constituents in 
the given relationship.
Each entity has multiple attributes that differ based on its needs. For example an INSTRUCTOR has attributes like Id, Rank, IName, 
IOffice, IPhone and a unique attribute is used to identify each entity. In this case the unique identifier used to identify a specific 
INSTRUCTOR is Id.


![Screenshot_1](https://user-images.githubusercontent.com/77344408/222260277-f00ae264-cefe-47d7-935e-7d701f53c7b2.png)

## What is the aim of design? 
In this project, we will design a database model for the extended version of the database design given above.
The primary aim of this design is to satisfy the new requirements given. In addition to this, this new EER diagram helps 
make the former ER diagram more readable and tidy. With the additions, the design became more understandable and 
rich in meaning. Another priority taken into consideration is trying our best to not interfere with the previous requirements
and the structures in the former design while introducing and integrating the new requirements.

##  Here are the newly added requirements:

* Database should keep track of the curriculums of each of the following departments in Turkey, respectively, Computer Engineering, Software Engineering, Artificial Intelligence Engineering.

* Each curriculum is composed of its own courses of type mandatory, optional (technical or non-technical).

* Design should have entities like CHAIR, FACULTY MEMBER (PROFESSOR, ASSOCIATE PROFESSOR, ASSISTANT PROFESSOR, INSTRUCTOR, RESEARCH ASSISTANT)

* Design should be able to store the instructors of the courses with their SECTION information.

* You should store information about the research areas of the FACULTY MEMBERs, their M.Sc. and Ph.D. theses.

* You should also store the keywords associated with each course and these keywords should be related to the research areas of the FACULTY MEMBERs to find whether a given COURSE is instructed by the most matched FACULTY MEMBER.

* For each of the course and curriculum, you should store a computed value of this matching criteria.

## Relational Model with New Requirements 
![Relational_Model](https://user-images.githubusercontent.com/77344408/222262764-a0e6837c-1e9b-4a43-81d0-cf2a116b017e.png)


## Enhanced E/R Diagram 

![EER_Model](https://user-images.githubusercontent.com/77344408/222262899-579e25ca-a4ec-4b90-aa58-70a625e90f8e.png)

## Note:
You can perform the database with MySQL using the given SQL files in repository.















