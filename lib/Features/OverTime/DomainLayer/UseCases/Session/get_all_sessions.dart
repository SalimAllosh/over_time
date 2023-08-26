import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/session_entity.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Repositories/session_repository.dart';

class GetAllSessionsUsecase {
  final SessionRepository sessionRepository;

  GetAllSessionsUsecase({required this.sessionRepository});

  Future<Either<Failure, List<SessionEntity>>> call() async {
    return sessionRepository.getAllSessions();
  }
}
