import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final int subjectID;
  final String subjectName;
  final String subjectDescription;

  SubjectEntity(
      {required this.subjectID,
      required this.subjectName,
      required this.subjectDescription});

  @override
  // TODO: implement props
  List<Object?> get props => [subjectID, subjectName, subjectDescription];
}
