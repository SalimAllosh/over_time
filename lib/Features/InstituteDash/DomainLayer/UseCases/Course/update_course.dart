import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/course_entity.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Repositories/course_repository.dart';

class UpdateCourseUsecase {
  final CourseRepository courseRepository;

  UpdateCourseUsecase({required this.courseRepository});

  Future<Either<Failure, Unit>> call(CourseEntity courseEntity) async {
    return courseRepository.updateCourse(courseEntity);
  }
}
