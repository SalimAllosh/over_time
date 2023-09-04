import 'package:flutter/material.dart';
import 'package:over_time/Features/Authentication/Page/auth_page.dart';
import 'package:over_time/Features/OverTime/PresentationLayer/Pages/Course/courses_page.dart';
import 'package:over_time/Features/OverTime/PresentationLayer/Pages/Course/insert_course.dart';
import 'package:over_time/Features/OverTime/PresentationLayer/Pages/Session/insert_session_page.dart';
import 'package:over_time/Features/OverTime/PresentationLayer/Pages/Session/sessions_page.dart';

class AppRoutes {
  static String authPageName = "/";
  static String getAuthPage() => authPageName;

  static String sessionPageName = "/Sessions/";
  static String getSessionPage() => sessionPageName;

  static String coursePageName = "/Courses/";
  static String getCoursePage() => coursePageName;

  static String insertSessionPageName = "/Sessions/InsertSession/";
  static String getInsertSessionPage() => insertSessionPageName;

  static String insertcoursePageName = "/Courses/InsertCourse/";
  static String getInsertCoursePage() => insertcoursePageName;

  static Map<String, Widget Function(BuildContext)> routes = {
    authPageName: (context) => AuthPage(),
    sessionPageName: (context) => SessionsPage(),
    insertSessionPageName: (context) => InsertSessionPage(),
    coursePageName: (context) => CoursesPage(),
    insertcoursePageName: (context) => InsertCoursePage()
  };
}
