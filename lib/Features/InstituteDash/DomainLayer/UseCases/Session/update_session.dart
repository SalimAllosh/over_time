import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/session_entity.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Repositories/session_repository.dart';

class UpdatesessionUsecase {
  final SessionRepository sessionRepository;

  UpdatesessionUsecase({required this.sessionRepository});

  Future<Either<Failure, Unit>> call(SessionEntity sessionEntity) async {
    return sessionRepository.updateSession(sessionEntity: sessionEntity);
  }
}
