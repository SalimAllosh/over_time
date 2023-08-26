import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/course_entity.dart';

abstract class CourseRepository {
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();
  Future<Either<Failure, CourseEntity>> getCourseByID(int courseID);
  Future<Either<Failure, Unit>> insertCourse(CourseEntity courseEntity);
  Future<Either<Failure, Unit>> updateCourse(CourseEntity courseEntity);
  Future<Either<Failure, Unit>> deleteCourse(int courseID);
}
