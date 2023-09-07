import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';

import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/student_entity.dart';

abstract class StudentRepository {
  Future<Either<Failure, List<StudentEntity>>> getAllStudents();
  Future<Either<Failure, Unit>> insertStudent(StudentEntity studentEntity);
  Future<Either<Failure, StudentEntity>> getStudentByID(int studentID);
  Future<Either<Failure, Unit>> deleteStudent(int studentID);
  Future<Either<Failure, Unit>> updateStudent(StudentEntity studentEntity);
}
