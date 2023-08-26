import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/course_entity.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Repositories/course_repository.dart';

class GetAllCourseUsecase {
  final CourseRepository courseRepository;

  GetAllCourseUsecase({required this.courseRepository});

  Future<Either<Failure, List<CourseEntity>>> call() async {
    return courseRepository.getAllCourses();
  }
}
