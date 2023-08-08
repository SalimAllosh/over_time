import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/session_entity.dart';

abstract class SessionRepository {
  Future<Either<Failure, List<SessionEntity>>> getAllSessions();
  Future<Either<Failure, List<SessionEntity>>> getSessionsByStudentName();
  Future<Either<Failure, List<SessionEntity>>> getSessionsByDate();
  Future<Either<Failure, List<SessionEntity>>> getSessionsByInstitute();

  Future<Either<Failure, Unit>> addSession(SessionEntity sessionEntity);
  Future<Either<Failure, Unit>> deleteSession(int sessionId);
  Future<Either<Failure, Unit>> updateSession(SessionEntity sessionEntity);
}
