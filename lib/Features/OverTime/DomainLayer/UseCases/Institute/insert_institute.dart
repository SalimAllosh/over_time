import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/institute_entity.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Repositories/institute_repository.dart';

class InsertInstituteUsecase {
  final InstituteRepository instituteRepository;

  InsertInstituteUsecase({required this.instituteRepository});

  Future<Either<Failure, Unit>> call(InstituteEntity instituteEntity) async {
    return instituteRepository.insertInstitute(instituteEntity);
  }
}
