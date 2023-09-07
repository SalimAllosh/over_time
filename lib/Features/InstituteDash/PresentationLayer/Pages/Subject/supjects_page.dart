import 'package:flutter/material.dart';
import 'package:over_time/Core/DummyData/subject_dummy.dart';
import 'package:over_time/Core/Route/app_routes.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/subject_entity.dart';
import 'package:over_time/Features/InstituteDash/PresentationLayer/Widgets/card_grid.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  List<SubjectEntity> subjects = dummySubjectList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Subjects"))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: CardsGrid(subjectsList: subjects),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.getInsertSubjectsPage());
          },
          child: const Icon(Icons.add)),
    );
  }
}
