import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final int sessionID;
  final int courseID;
  final double duration;
  final DateTime sessionDate;
  final String givenMaterial;
  final String sessionNote;
  final double sessionRate;
  final bool isOverTime;

  const SessionEntity(
      {required this.givenMaterial,
      required this.sessionNote,
      required this.sessionRate,
      required this.isOverTime,
      required this.sessionID,
      required this.courseID,
      required this.duration,
      required this.sessionDate});

  @override
  List<Object?> get props => [
        sessionID,
        courseID,
        duration,
        sessionDate,
        givenMaterial,
        sessionNote,
        sessionRate,
        isOverTime
      ];
}
