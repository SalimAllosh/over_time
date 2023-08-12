import 'package:over_time/Features/OverTime/DomainLayer/Entities/session_entity.dart';

class Session extends SessionEntity{
  const Session({required super.id, required super.studentName, required super.subject, required super.date, required super.duration, required super.hourlyRate, required super.cost, required super.sessionType , super.instituteName});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_name': studentName,
      'subject': subject,
      'date': date.toIso8601String(),
      'duration': duration,
      'hourly_rate': hourlyRate,
      'cost': cost,
      'session_type': sessionType,
      'institute_name': instituteName,
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      id: map['id'],
      studentName: map['student_name'],
      subject: map['subject'],
      date: DateTime.parse(map['date']),
      duration: map['duration'],
      hourlyRate: map['hourly_rate'],
      cost: map['cost'],
      sessionType: map['session_type'],
      instituteName: map['institute_name'],
    );
  }

}