class StudentEntity {
  final int studentID;
  final String studentName;
  final String? studentNote;

  StudentEntity(
      {required this.studentID, required this.studentName, this.studentNote});
}
