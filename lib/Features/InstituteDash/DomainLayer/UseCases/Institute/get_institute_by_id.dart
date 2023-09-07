import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/institute_entity.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Repositories/institute_repository.dart';

class GetInstituteByIDUsecase {
  final InstituteRepository instituteRepository;

  GetInstituteByIDUsecase({required this.instituteRepository});

  Future<Either<Failure, InstituteEntity>> call(int instituteID) async {
    return instituteRepository.getInstituteByID(instituteID);
  }
}
