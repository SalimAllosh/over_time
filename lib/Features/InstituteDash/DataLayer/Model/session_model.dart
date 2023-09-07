import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/session_entity.dart';

class Session extends SessionEntity {
  Session(
      {required super.sessionID,
      required super.courseID,
      required super.duration,
      required super.sessionDate,
      required super.givenMaterial,
      required super.sessionNote,
      required super.sessionRate,
      required super.isOverTime});

  Map<String, dynamic> toMap() {
    return {
      'sessionID': sessionDate,
      'courseID': courseID,
      'duration': duration,
      'sessionDate': sessionDate,
      'givenMaterial': givenMaterial,
      'sessionNote': sessionNote,
      'sessionRate': sessionRate,
      'isOverTime': isOverTime
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      sessionID: map['sessionID'],
      courseID: map['courseID'],
      duration: map['duration'],
      sessionDate: map['sessionDate'],
      givenMaterial: map['givenMaterial'],
      sessionNote: map['sessionNote'],
      sessionRate: map['sessionRate'],
      isOverTime: map['isOverTime'],
    );
  }
}
