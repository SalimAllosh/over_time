import 'package:over_time/Features/OverTime/DomainLayer/Entities/session_entity.dart';

class Session extends SessionEntity {
  Session(
      {required super.sessionID,
      required super.courseID,
      required super.duration,
      required super.sessionDate});

  Map<String, dynamic> toMap() {
    return {
      'sessionID': sessionDate,
      'courseID': courseID,
      'duration': duration,
      'sessionDate': sessionDate
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
        sessionID: map['sessionID'],
        courseID: map['courseID'],
        duration: map['duration'],
        sessionDate: map['sessionDate']);
  }
}
