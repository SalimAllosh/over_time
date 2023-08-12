import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/session_entity.dart';

abstract class SessionRepository {
  Future<Either<Failure, List<SessionEntity>>> getAllSessions();
  Future<Either<Failure, List<SessionEntity>>> getSessionsByStudentName(
      {required String studentName});
  Future<Either<Failure, List<SessionEntity>>> getSessionsByDate(
      {required String month, required String year});
  Future<Either<Failure, List<SessionEntity>>> getSessionsByInstitute(
      {required String instituteName});

  Future<Either<Failure, Unit>> addSession(
      {required SessionEntity sessionEntity});
  Future<Either<Failure, Unit>> deleteSession({required int sessionId});
  Future<Either<Failure, Unit>> updateSession(
      {required SessionEntity sessionEntity});
}
