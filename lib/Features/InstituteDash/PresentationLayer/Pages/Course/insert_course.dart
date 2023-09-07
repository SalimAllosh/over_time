import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:over_time/Core/DummyData/institute_list.dart';
import 'package:over_time/Core/DummyData/students_dummy_data.dart';
import 'package:over_time/Core/DummyData/subject_dummy.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/institute_entity.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/student_entity.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/subject_entity.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class InsertCoursePage extends StatefulWidget {
  const InsertCoursePage({super.key});

  @override
  State<InsertCoursePage> createState() => _InsertCoursePageState();
}

class _InsertCoursePageState extends State<InsertCoursePage> {
  List<SubjectEntity> subjects = dummySubjectList;
  List<InstituteEntity> institute = instituteList;
  List<StudentEntity> students = dummyStudentList;

  SubjectEntity selectedSubject = dummySubjectList[0];
  InstituteEntity selectedInstitute = instituteList[0];
  StudentEntity selectedStudent = dummyStudentList[0];

  String courseType = "Onsite";
  double hourlyRate = 0.0;
  DateTime startDate = DateTime(0);

  TextEditingController selectedhourlyRate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Course"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            institutesChoicesBuilder(context),
            subjectsChoicesBuilder(context),
            studentsChoicesBuilder(context),
            dateTimePickerBuilder(context),
            courseTypeChoicesBuilder(context),
            hourlyRateBuilder(context),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Insert Course")),
          ],
        ),
      )),
    );
  }

  Row hourlyRateBuilder(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.32,
          child: Text(
            "H-Rate :",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: TextField(
            controller: selectedhourlyRate,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value == "") {
                hourlyRate = 0.0;
              } else {
                hourlyRate = double.parse(selectedhourlyRate.text);
              }
            },
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
                isDense: true,
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(15))),
          ),
        )
      ],
    );
  }

  EasyDateTimeLine dateTimePickerBuilder(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        startDate = selectedDate;
      },
      dayProps: EasyDayProps(
        //  height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
      ),
      headerProps: EasyHeaderProps(
          selectedDateFormat: SelectedDateFormat.fullDateMonthAsStrDY,
          selectedDateStyle: Theme.of(context).textTheme.labelMedium),
      itemBuilder: (BuildContext context, String dayNumber, dayName, monthName,
          fullDate, isSelected) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.2,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: isSelected
                  ? Theme.of(context).colorScheme.secondary
                  : const Color.fromARGB(255, 149, 149, 149),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                monthName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? Colors.white
                      : const Color.fromARGB(255, 149, 149, 149),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                dayNumber,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? Colors.white
                      : const Color.fromARGB(255, 149, 149, 149),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                dayName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? Colors.white
                      : const Color.fromARGB(255, 149, 149, 149),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row institutesChoicesBuilder(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.32,
          child: Text(
            "Institute:",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<InstituteEntity>(
              isExpanded: true,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
              hint: const Text('Institute'),
              items: institute.map((InstituteEntity institute) {
                return DropdownMenuItem<InstituteEntity>(
                  value: institute,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    child: Text(institute.instituteName,
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis),
                  ),
                );
              }).toList(),
              value: selectedInstitute,
              onChanged: (value) {
                setState(() {
                  selectedInstitute = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Row subjectsChoicesBuilder(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.32,
          child: Text(
            "Subject:",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<SubjectEntity>(
              isExpanded: true,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
              hint: const Text('Institute'),
              items: subjects.map((SubjectEntity subject) {
                return DropdownMenuItem<SubjectEntity>(
                  value: subject,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    child: Text(subject.subjectName,
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis),
                  ),
                );
              }).toList(),
              value: selectedSubject,
              onChanged: (value) {
                setState(() {
                  selectedSubject = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Row studentsChoicesBuilder(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.32,
          child: Text(
            "Student:",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<StudentEntity>(
              isExpanded: true,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
              hint: const Text('Student'),
              items: students.map((StudentEntity student) {
                return DropdownMenuItem<StudentEntity>(
                  value: student,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    child: Text(student.studentName,
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis),
                  ),
                );
              }).toList(),
              value: selectedStudent,
              onChanged: (value) {
                setState(() {
                  selectedStudent = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Row courseTypeChoicesBuilder(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.32,
          child: Text(
            "Type:",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
              hint: const Text('Student'),
              items: [
                DropdownMenuItem<String>(
                  value: "Onsite",
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    child: Text("Onsite",
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "Online",
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    child: Text("Online",
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
              value: courseType,
              onChanged: (value) {
                setState(() {
                  courseType = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
