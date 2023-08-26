import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/institute_entity.dart';

abstract class InstituteRepository {
  Future<Either<Failure, List<InstituteEntity>>> getAllInstitutes();
  Future<Either<Failure, Unit>> insertInstitute(
      InstituteEntity instituteEntity);
  Future<Either<Failure, InstituteEntity>> getInstituteByID(int instituteID);
  Future<Either<Failure, Unit>> deleteInstitute(int instituteID);
  Future<Either<Failure, Unit>> updateInstitute(
      InstituteEntity instituteEntity);
}
