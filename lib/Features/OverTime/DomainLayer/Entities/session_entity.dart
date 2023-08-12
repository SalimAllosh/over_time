import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final int id;
  final String studentName;
  final String subject;
  final DateTime date;
  final double duration;
  final double hourlyRate;
  final double cost;
  final String sessionType;
  final String? instituteName;

  const SessionEntity(
      {required this.id,
      required this.studentName,
      required this.subject,
      required this.date,
      required this.duration,
      required this.hourlyRate,
      required this.cost,
      required this.sessionType,
      this.instituteName});

  @override
  List<Object?> get props => [
        id,
        studentName,
        subject,
        date,
        duration,
        hourlyRate,
        cost,
        sessionType,
        instituteName
      ];
}
