import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Repositories/course_repository.dart';

class DeleteCourseUsecase {
  final CourseRepository courseRepository;

  DeleteCourseUsecase({required this.courseRepository});

  Future<Either<Failure, Unit>> call(int courseID) async {
    return courseRepository.deleteCourse(courseID);
  }
}
