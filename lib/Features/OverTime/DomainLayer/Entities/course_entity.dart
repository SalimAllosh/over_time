import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final int courseID;
  final int instituteID;
  final int subjectID;
  final int studentID;
  final int sessionID;
  final DateTime startDate;
  final DateTime? endDate;
  final String courseType;
  final double hourlyRate;
  final String studentName;
  final String? studentNote;
  final double courseDuration;
  final double total;

  CourseEntity(
      {required this.courseID,
      required this.instituteID,
      required this.subjectID,
      required this.studentID,
      required this.sessionID,
      required this.startDate,
      this.endDate,
      required this.courseType,
      required this.hourlyRate,
      required this.studentName,
      this.studentNote,
      required this.courseDuration,
      required this.total});

  @override
  // TODO: implement props
  List<Object?> get props => [
        courseID,
        instituteID,
        subjectID,
        studentID,
        sessionID,
        startDate,
        endDate,
        courseType,
        hourlyRate,
        studentName,
        studentNote,
        courseDuration,
        total
      ];
}
