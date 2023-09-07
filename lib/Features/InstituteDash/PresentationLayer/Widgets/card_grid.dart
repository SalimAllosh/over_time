import 'package:flutter/material.dart';
import 'package:over_time/Core/Route/app_routes.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/student_entity.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/subject_entity.dart';

class CardsGrid extends StatelessWidget {
  final List<StudentEntity>? studentsList;
  final List<SubjectEntity>? subjectsList;

  const CardsGrid({
    super.key,
    this.studentsList,
    this.subjectsList,
  });

  @override
  Widget build(BuildContext context) {
    List wantedList = [];
    if (studentsList == null) {
      wantedList = subjectsList!;
    } else {
      wantedList = studentsList!;
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: wantedList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (studentsList == null) {
              Navigator.of(context).pushNamed(AppRoutes.getInsertSubjectsPage(),
                  arguments: wantedList[index]);
            } else {
              Navigator.of(context).pushNamed(AppRoutes.getInsertStudentsPage(),
                  arguments: wantedList[index]);
            }
          },
          child: studentsList != null
              ? studentcardbuilder(context, wantedList, index)
              : subjectcardbuilder(context, wantedList, index),
        );
      },
    );
  }

  Card studentcardbuilder(
      BuildContext context, List<dynamic> wantedList, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(Icons.person),
          ),
          Text(wantedList[index].studentName,
              style: Theme.of(context).textTheme.labelMedium,
              overflow: TextOverflow.ellipsis),
          wantedList[index].studentNote == null
              ? Text("No Notes Available ",
                  style: Theme.of(context).textTheme.displaySmall,
                  overflow: TextOverflow.ellipsis)
              : Text(wantedList[index].studentNote!,
                  style: Theme.of(context).textTheme.displaySmall,
                  overflow: TextOverflow.ellipsis),
        ]),
      ),
    );
  }

  Card subjectcardbuilder(
      BuildContext context, List<dynamic> wantedList, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(Icons.book),
          ),
          Text(wantedList[index].subjectName,
              style: Theme.of(context).textTheme.labelMedium,
              overflow: TextOverflow.ellipsis),
          wantedList[index].subjectDescription == null
              ? Text("No Notes Available ",
                  style: Theme.of(context).textTheme.displaySmall,
                  overflow: TextOverflow.ellipsis)
              : Text(wantedList[index].subjectDescription!,
                  style: Theme.of(context).textTheme.displaySmall,
                  overflow: TextOverflow.ellipsis),
        ]),
      ),
    );
  }
}
