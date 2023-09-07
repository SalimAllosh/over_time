import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/session_entity.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Repositories/session_repository.dart';

class GetSessionUsecase {
  final SessionRepository sessionRepository;

  GetSessionUsecase({required this.sessionRepository});

  Future<Either<Failure, List<SessionEntity>>> call(String studentName) async {
    return sessionRepository.getSessionsByStudentName(studentName: studentName);
  }
}
