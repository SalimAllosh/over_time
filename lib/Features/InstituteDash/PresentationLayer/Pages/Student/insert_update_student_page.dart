import 'package:flutter/material.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/student_entity.dart';

class InsertUpdateStudentPage extends StatefulWidget {
  const InsertUpdateStudentPage({super.key});

  @override
  State<InsertUpdateStudentPage> createState() =>
      _InsertUpdateStudentPageState();
}

class _InsertUpdateStudentPageState extends State<InsertUpdateStudentPage> {
  TextEditingController studentName = TextEditingController();
  TextEditingController studentNote = TextEditingController();
  init(StudentEntity student) {
    studentName.text = student.studentName;
    if (student.studentNote != null) {
      studentNote.text = student.studentNote!;
    } else {
      studentNote.text = "No available note ";
    }
  }

  @override
  Widget build(BuildContext context) {
    final student =
        ModalRoute.of(context)?.settings.arguments as StudentEntity?;
    if (student != null) {
      init(student);
    }

    return Scaffold(
      appBar: AppBar(
        title: student == null ? const Text("Insert") : const Text("Update"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: MediaQuery.of(context).size.width * 0.25,
                child: Icon(
                  Icons.person_2_rounded,
                  size: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: studentName,
                decoration: InputDecoration(
                    label: const Text("Student Name"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2))),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: studentNote,
                decoration: InputDecoration(
                    label: const Text("Student Note"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2))),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: student != null
                        ? const Text("Update")
                        : const Text("Insert")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
