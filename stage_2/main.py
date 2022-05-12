import random

DATA = ["Geography", "Math", "Science", "Java", "SQL", "Complexity", "Algorithms", "Drawing"]


def rnd_sub():
    rnd_num = random.randint(0, 7)
    return DATA[rnd_num]


def rnd_from_list(list_given):
    list_len = len(list_given)
    rnd = random.randint(0, list_len - 1)
    return list_given[rnd]


def extract_info(in_file, pos, endpos):
    info_list = []
    lines = in_file.readlines()
    for line in lines:
        values_start_pos = line.rindex('(', 0, endpos)
        line_comp = line[values_start_pos + 1:].split(",")
        info_list.append(line_comp[pos].strip())
    return info_list


study_out_file = open("Study.sql", "a")
in_file = open("teacher_id.txt", 'r')
test_in_file = open("Test_id.txt", "r")
scholar_in_file = open("Scholar_id.txt", "r")
studies_out_file = open("Studies.sql", "a")
course_in_file = open("courses.txt", "r")
course_out_file = open("Course.sql", "a")
current_teacher_file = open("Study.sql", "r")

teacher_list = extract_info(in_file, 0, 90)
test_list = extract_info(test_in_file, 0, 50)
scholar_list = extract_info(scholar_in_file, 1, 130)

for i in range(100):
    rnd_id = random.randint(100, 999)
    rnd_cap = random.randint(100, 500)
    teacher_id = rnd_from_list(teacher_list)
    test_id = rnd_from_list(test_list)
    out_file.write(f"insert into Course values({rnd_id},'{rnd_sub()}',{rnd_cap},{teacher_id},{test_id});\n")

t_list = []
for j in range(50):
    rnd_teach = rnd_from_list(teacher_list)
    while rnd_teach in t_list:
        rnd_teach = rnd_from_list(teacher_list)
    t_list.append(rnd_teach)
    s_list = []
    for i in range(30):
        rnd_scholar = rnd_from_list(scholar_list)
        while rnd_scholar in s_list:
            rnd_scholar = rnd_from_list(scholar_list)
        study_out_file.write(f"insert into study values({rnd_teach},{rnd_scholar});\n")
        s_list.append(rnd_scholar)

current_teacher = list(set(extract_info(current_teacher_file, 0, 30)))
current_test = []
courses_list = course_in_file.readlines()
for course_row in courses_list:
    index = course_row.find("#")
    new_row = course_row[:index - 2] + f"{int(rnd_from_list(current_teacher))}" + course_row[index+2:]
    # new_row = course_row.replace("#", str(int(rnd_from_list(current_teacher))))
    rnd_test = rnd_from_list(test_list)
    while rnd_test in current_test:
        rnd_test = rnd_from_list(test_list)
    current_test.append(rnd_test)
    index = new_row.find("$")
    new_row = new_row[:index-2] + f"{int(rnd_test)}" + new_row[index + 2:]

    course_out_file.write(new_row)
