CREATE TABLE Teacher
(
  Teach_ID INT NOT NULL,
  Teach_Name VARCHAR(15) NOT NULL,
  Age INT,
  Teach_address VARCHAR(30) NOT NULL,
  Teach_gender VARCHAR(11) NOT NULL,
  PRIMARY KEY (Teach_ID)
);

CREATE TABLE Scholar
(
  Scholar_Name VARCHAR(8) NOT NULL,
  Scholar_ID INT NOT NULL,
  Name_of_parents VARCHAR(8),
  Scholar_adress VARCHAR(8) NOT NULL,
  Scholar_grade INT NOT NULL,
  Scholar_gender VARCHAR(11) NOT NULL,
  PRIMARY KEY (Scholar_ID)
);

CREATE TABLE Administration
(
  Adm_ID INT NOT NULL,
  Adm_name VARCHAR(8) NOT NULL,
  Adm_Roll VARCHAR(8) NOT NULL,
  Adm_gender VARCHAR(11) NOT NULL,
  Adm_Salary INT NOT NULL,
  PRIMARY KEY (Adm_ID)
);

CREATE TABLE Tests
(
  Test_ID INT NOT NULL,
  Test_name VARCHAR(8) NOT NULL,
  Test_Date DATE NOT NULL,
  PRIMARY KEY (Test_ID)
);

CREATE TABLE Buildings
(
  Build_num INT NOT NULL,
  Build_name VARCHAR(8),
  Build_floors INT NOT NULL,
  Build_Exits INT NOT NULL,
  PRIMARY KEY (Build_num)
);

CREATE TABLE Course
(
  Course_ID INT NOT NULL,
  Course_Sub VARCHAR(8) NOT NULL,
  Course_Capacity INT NOT NULL,
  Teach_ID INT NOT NULL,
  Test_ID INT NOT NULL,
  PRIMARY KEY (Course_ID),
  FOREIGN KEY (Teach_ID) REFERENCES Teacher(Teach_ID),
  FOREIGN KEY (Test_ID) REFERENCES Tests(Test_ID)
);

CREATE TABLE Machine
(
  Mach_ID INT NOT NULL,
  Mach_Type VARCHAR(8) NOT NULL,
  Mach_Capacity INT NOT NULL,
  Mach_Paymethod VARCHAR(8) NOT NULL,
  Build_num INT NOT NULL,
  PRIMARY KEY (Mach_ID),
  FOREIGN KEY (Build_num) REFERENCES Buildings(Build_num)
);

CREATE TABLE study
(
  Teach_ID INT NOT NULL,
  Scholar_ID INT NOT NULL,
  PRIMARY KEY (Teach_ID, Scholar_ID),
  FOREIGN KEY (Teach_ID) REFERENCES Teacher(Teach_ID),
  FOREIGN KEY (Scholar_ID) REFERENCES Scholar(Scholar_ID)
);

CREATE TABLE studies
(
  Scholar_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  PRIMARY KEY (Scholar_ID, Course_ID),
  FOREIGN KEY (Scholar_ID) REFERENCES Scholar(Scholar_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Security
(
  Sec_ID INT NOT NULL,
  Weapon VARCHAR(8),
  Sec_Name VARCHAR(8) NOT NULL,
  Sec_Age INT NOT NULL,
  Sec_Shift VARCHAR(8) NOT NULL,
  Build_num INT NOT NULL,
  Sec_gender VARCHAR(11) NOT NULL,
  PRIMARY KEY (Sec_ID),
  FOREIGN KEY (Build_num) REFERENCES Buildings(Build_num)
);

CREATE TABLE Cleaner
(
  Cleaner_ID INT NOT NULL,
  Cleaner_Name VARCHAR(8) NOT NULL,
  Cleaner_Shift  VARCHAR(8) NOT NULL,
  Build_num INT NOT NULL,
  Sec_gender VARCHAR(11) NOT NULL,
  PRIMARY KEY (Cleaner_ID),
  FOREIGN KEY (Build_num) REFERENCES Buildings(Build_num)
);

CREATE TABLE Class
(
  Class_num VARCHAR(8) NOT NULL,
  clean INT,
  Class_Capacity INT NOT NULL,
  Class_Wind_Num INT NOT NULL,
  Build_num INT NOT NULL,
  PRIMARY KEY (Class_num),
  FOREIGN KEY (Build_num) REFERENCES Buildings(Build_num)
);
