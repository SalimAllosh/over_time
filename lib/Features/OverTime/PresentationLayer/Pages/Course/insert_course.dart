import 'dart:ffi';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:over_time/Core/DummyData/institute_list.dart';
import 'package:over_time/Core/DummyData/students_dummy_data.dart';
import 'package:over_time/Core/DummyData/subject_dummy.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/institute_entity.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/student_entity.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/subject_entity.dart';

class InsertCoursePage extends StatefulWidget {
  const InsertCoursePage({super.key});

  @override
  State<InsertCoursePage> createState() => _InsertCoursePageState();
}

class _InsertCoursePageState extends State<InsertCoursePage> {
  // CourseEntity courseEntity = CourseEntity(
  //
  //
  //
  //
  //     courseDuration: courseDuration,
  //     total: total);
  List<SubjectEntity> subjects = dummySubjectList;
  List<InstituteEntity> institute = instituteList;
  List<StudentEntity> students = dummyStudentList;

  SubjectEntity selectedSubject = dummySubjectList[0];
  InstituteEntity selectedInstitute = instituteList[0];
  StudentEntity selectedStudent = dummyStudentList[0];

  String courseType = "";
  double hourlyRate = 0.0;
  DateTime startDate = DateTime(0);
  bool courseActive = false;

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
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      )),
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
}
