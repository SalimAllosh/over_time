import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/session_entity.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Repositories/session_repository.dart';

class AddSessionUsecase {
  final SessionRepository sessionRepository;

  AddSessionUsecase({required this.sessionRepository});

  Future<Either<Failure, Unit>> call(SessionEntity session) async {
    return sessionRepository.addSession(sessionEntity: session);
  }
}
