import 'package:over_time/Features/OverTime/DomainLayer/Entities/session_entity.dart';

List<SessionEntity> dummySessionList = [
  SessionEntity(
    sessionID: 1,
    courseID: 101,
    duration: 1.5,
    sessionDate: DateTime(2023, 8, 25, 9, 0),
  ),
  SessionEntity(
    sessionID: 2,
    courseID: 102,
    duration: 1.25,
    sessionDate: DateTime(2023, 7, 4, 11, 0),
  ),
  SessionEntity(
    sessionID: 3,
    courseID: 103,
    duration: 1,
    sessionDate: DateTime(2023, 6, 5, 14, 0),
  ),
  SessionEntity(
    sessionID: 4,
    courseID: 104,
    duration: 0.5,
    sessionDate: DateTime(2023, 6, 7, 16, 0),
  ),
];
