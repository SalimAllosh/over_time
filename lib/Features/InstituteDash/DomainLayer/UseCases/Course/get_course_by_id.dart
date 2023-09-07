import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/course_entity.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Repositories/course_repository.dart';

class GetCourseByIDUsecase {
  final CourseRepository courseRepository;

  GetCourseByIDUsecase({required this.courseRepository});

  Future<Either<Failure, CourseEntity>> call(int courseID) async {
    return courseRepository.getCourseByID(courseID);
  }
}
