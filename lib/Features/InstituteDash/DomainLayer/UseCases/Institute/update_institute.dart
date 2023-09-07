import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/institute_entity.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Repositories/institute_repository.dart';

class UpdateInstituteUsecase {
  final InstituteRepository instituteRepository;

  UpdateInstituteUsecase({required this.instituteRepository});

  Future<Either<Failure, Unit>> call(InstituteEntity instituteEntity) async {
    return instituteRepository.updateInstitute(instituteEntity);
  }
}
