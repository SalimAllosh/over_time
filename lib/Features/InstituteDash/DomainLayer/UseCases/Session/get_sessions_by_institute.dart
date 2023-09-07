import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/session_entity.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Repositories/session_repository.dart';

class GetSessionsByInstituteUsecase {
  final SessionRepository sessionRepository;

  GetSessionsByInstituteUsecase({required this.sessionRepository});

  Future<Either<Failure, List<SessionEntity>>> call(String institute) async {
    return sessionRepository.getSessionsByInstitute(instituteName: institute);
  }
}
