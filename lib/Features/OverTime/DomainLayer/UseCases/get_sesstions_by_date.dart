import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/session_entity.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Repositories/session_repository.dart';

class GetSesstionByDateUsecase {
  final SessionRepository sessionRepository;

  GetSesstionByDateUsecase({required this.sessionRepository});

  Future<Either<Failure, List<SessionEntity>>> call(
      String month, String year) async {
    return sessionRepository.getSessionsByDate(month: month, year: year);
  }
}
