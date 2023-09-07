import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/subject_entity.dart';

abstract class SubjectRepository {
  Future<Either<Failure, List<SubjectEntity>>> getAllSubjects();
  Future<Either<Failure, Unit>> insertSubject(SubjectEntity subjectEntity);
  Future<Either<Failure, SubjectEntity>> getSubjectByID(int subjectID);
  Future<Either<Failure, Unit>> deleteSubject(int subjectID);
  Future<Either<Failure, Unit>> updateSubject(SubjectEntity subjectEntity);
}
