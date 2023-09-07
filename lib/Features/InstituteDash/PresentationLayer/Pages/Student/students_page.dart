import 'package:flutter/material.dart';
import 'package:over_time/Core/DummyData/students_dummy_data.dart';
import 'package:over_time/Core/Route/app_routes.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/student_entity.dart';
import 'package:over_time/Features/InstituteDash/PresentationLayer/Widgets/card_grid.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List<StudentEntity> students = dummyStudentList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Students"))),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: CardsGrid(studentsList: students),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.getInsertStudentsPage());
          },
          child: const Icon(Icons.add)),
    );
  }
}
