import 'package:flutter/material.dart';
import 'package:over_time/Core/DummyData/course_dummy_data.dart';
import 'package:over_time/Core/Route/app_routes.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/course_entity.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({super.key});
  final List<CourseEntity> courses = dummyCourseList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Courses")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (1 / 2),
                ),
                itemCount: courses.length,
                itemBuilder: (BuildContext context, int index) {
                  return gridbuilder(context, index);
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text("Generate Report"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.getInsertCoursePage());
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget gridbuilder(BuildContext context, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Text(courses[index].courseID.toString())),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            rowIconAndLabel(context, Icons.account_balance_outlined,
                "InstituteID Name botato"),
            rowIconAndLabel(
                context, Icons.book_outlined, "Subject Name botato"),
            rowIconAndLabel(
                context, Icons.person_outline_outlined, "Student Name botato"),
            rowIconAndLabel(context, Icons.check_box_outlined, "Status"),
            rowIconAndLabel(context, Icons.date_range_outlined, "Start date "),
            rowIconAndLabel(context, Icons.date_range_outlined, "End date "),
            rowIconAndLabel(context, Icons.article_outlined, "Course Type"),
            rowIconAndLabel(context, Icons.attach_money, "Hourly Rate"),
            rowIconAndLabel(context, Icons.timer_outlined, "Course Duration"),
            rowIconAndLabel(context, Icons.request_page_outlined, "Total"),
          ],
        ),
      ),
    );
  }

  Widget rowIconAndLabel(
      BuildContext context, IconData iconData, String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(iconData),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
