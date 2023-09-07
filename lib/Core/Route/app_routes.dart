import 'package:flutter/material.dart';
import 'package:over_time/Features/Authentication/Page/auth_page.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/student_entity.dart';
import 'package:over_time/Features/InstituteDash/PresentationLayer/Pages/Course/courses_page.dart';
import 'package:over_time/Features/InstituteDash/PresentationLayer/Pages/Course/insert_course.dart';
import 'package:over_time/Features/InstituteDash/PresentationLayer/Pages/Session/insert_session_page.dart';
import 'package:over_time/Features/InstituteDash/PresentationLayer/Pages/Session/sessions_page.dart';
import 'package:over_time/Features/InstituteDash/PresentationLayer/Pages/Student/insert_update_student_page.dart';
import 'package:over_time/Features/InstituteDash/PresentationLayer/Pages/Student/students_page.dart';
import 'package:over_time/Features/InstituteDash/PresentationLayer/Pages/Subject/insert_subject.dart';
import 'package:over_time/Features/InstituteDash/PresentationLayer/Pages/Subject/supjects_page.dart';

class AppRoutes {
  static String authPageName = "/";
  static String getAuthPage() => authPageName;

  static String sessionPageName = "/Sessions/";
  static String getSessionPage() => sessionPageName;

  static String coursePageName = "/Courses/";
  static String getCoursePage() => coursePageName;

  static String studentsPageName = "/Students/";
  static String getStudentsPage() => studentsPageName;

  static String subjectsPageName = "/Subjects/";
  static String getSubjectsPage() => subjectsPageName;

  static String insertSessionPageName = "/Sessions/InsertSession/";
  static String getInsertSessionPage() => insertSessionPageName;

  static String insertcoursePageName = "/Courses/InsertCourse/";
  static String getInsertCoursePage() => insertcoursePageName;

  static String insertStudentsPageName = "/Students/InsertStudents/";
  static String getInsertStudentsPage() => insertStudentsPageName;

  static String insertSubjectsPageName = "/Subjects/InsertSubjects/";
  static String getInsertSubjectsPage() => insertSubjectsPageName;

  static Map<String, Widget Function(BuildContext)> routes = {
    authPageName: (context) => AuthPage(),
    sessionPageName: (context) => SessionsPage(),
    insertSessionPageName: (context) => InsertSessionPage(),
    coursePageName: (context) => CoursesPage(),
    insertcoursePageName: (context) => InsertCoursePage(),
    studentsPageName: (context) => StudentsPage(),
    insertStudentsPageName: (context) => InsertUpdateStudentPage(),
    subjectsPageName: (context) => SubjectsPage(),
    insertSubjectsPageName: (context) => InsertUpdateSubjectPage()
  };
}
