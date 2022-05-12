-- select the buldings name of their security guard is above given age and gender
select Build_name 
from Buildings B
where B.Build_num IN (select S.Build_num 
                     from Security S 
                     where S.Sec_Age > &<name=age hint = "age value between 25-45" type = "integer"> 
                     and S.Sec_Gender =&<name=sec_gen list = "'Male','Female'"> );



--Select buldings name of their cleaner start with letter given
select Build_name 
from Buildings B
where B.Build_num IN (select C.Build_num 
                     from Cleaner C 
                     where C.Cleaner_Name like &<name=startWith hint="put ' befor the letter and then %'">);
                      
--Select Teacher's name that exists a student they teach with grade grater than parameter
select distinct T.Teach_Name
from Teacher T , Study Stu 
where T.TEACH_ID = Stu.Teach_Id and T.TEACH_GENDER =&<name=teach_gen list = "'Male','Female'"> and Exists (select * 
                                           from  Scholar S,Study ST 
                                           where S.SCHOLAR_ID = ST.SCHOLAR_ID and ST.TEACH_ID = T.TEACH_ID and S.SCHOLAR_GRADE > &<name=grade> );


--Sort building according to given parameters
select B.Build_name,B.Build_num from Buildings B order by B.BUILD_NUM &<name="Descending sort order" checkbox="desc,">;


-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Update Machine capacity across all building with the same name
update Machine
set Machine.Mach_Capacity = &<name=Capacity type=integer hint="capacity between 50-250">
where Machine.Build_Num IN (select B.BUILD_NUM from Buildings B where B.BUILD_NAME = &<name="build_name" list "select B.BUILD_NAME from Buildings B">); 

-- Update cleaner shift if they clean with the same shift who has securtiy with given weapon
update Cleaner
set Cleaner.Cleaner_Shift  = &<name="shift" list= "'MORNING','NIGHT'">
WHERE Cleaner.Build_Num IN (select C.BUILD_NUM 
                           from Security S , Cleaner C 
                           where S.BUILD_NUM = C.Build_Num and S.SEC_SHIFT = C.CLEANER_SHIFT 
                           and S.WEAPON =&<name=sec_Weapon list="select distinct S.WEAPON from Security S" type=string> );
                           
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--Delete Admin who salary above given parametrs
delete from Administration
where Administration.Adm_Gender =&<name=adm_gen list = "'Male','Female'"> and Administration.Adm_Salary > &<name="admSalary" type=integer>

-- Delete Course if the course the test is on dates given
delete from Course C
where EXISTS (select T.Test_ID 
             from Tests T 
             where C.TEST_ID = T.TEST_ID 
             and  T.TEST_DATE between to_date(&d_from,'yyyy/mm/dd') and to_date(&d_to,'yyyy/mm/dd'));
