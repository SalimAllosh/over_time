import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final int sessionID;
  final int courseID;
  final double duration;
  final DateTime sessionDate;

  SessionEntity(
      {required this.sessionID,
      required this.courseID,
      required this.duration,
      required this.sessionDate});

  @override
  // TODO: implement props
  List<Object?> get props => [sessionID, courseID, duration, sessionDate];
}
