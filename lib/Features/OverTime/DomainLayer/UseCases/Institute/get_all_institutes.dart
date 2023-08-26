import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/institute_entity.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Repositories/institute_repository.dart';

class GetAllInstituteUsecase {
  final InstituteRepository instituteRepository;

  GetAllInstituteUsecase({required this.instituteRepository});

  Future<Either<Failure, List<InstituteEntity>>> call() async {
    return instituteRepository.getAllInstitutes();
  }
}
