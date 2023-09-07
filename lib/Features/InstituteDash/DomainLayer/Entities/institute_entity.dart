import 'package:equatable/equatable.dart';

class InstituteEntity extends Equatable {
  final int instituteID;
  final String instituteName;
  final String? instituteLocation;
  final double instituteBalance;

  const InstituteEntity(
      {required this.instituteID,
      required this.instituteName,
      this.instituteLocation,
      required this.instituteBalance});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [instituteID, instituteName, instituteLocation, instituteBalance];
}
