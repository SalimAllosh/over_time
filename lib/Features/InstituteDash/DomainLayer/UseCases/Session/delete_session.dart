import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Repositories/session_repository.dart';

class DeleteSessionUsecase {
  final SessionRepository sessionRepository;

  DeleteSessionUsecase({required this.sessionRepository});

  Future<Either<Failure, Unit>> call(int sessionId) {
    return sessionRepository.deleteSession(sessionId: sessionId);
  }
}
