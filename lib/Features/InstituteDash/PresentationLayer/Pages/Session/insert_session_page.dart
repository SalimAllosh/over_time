import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:over_time/Core/DummyData/course_dummy_data.dart';
import 'package:over_time/Features/Authentication/blocs/bio_auth_cubit.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/course_entity.dart';

import '../../../../../Core/Messages/messages.dart';

class InsertSessionPage extends StatefulWidget {
  const InsertSessionPage({super.key});

  @override
  State<InsertSessionPage> createState() => _InsertSessionPageState();
}

class _InsertSessionPageState extends State<InsertSessionPage> {
  int selectedCourse = -1;
  double selectedDuration = -1;
  TextEditingController customDuration = TextEditingController();

  List<CourseEntity> courses = dummyCourseList;

  TextEditingController givenMaterial = TextEditingController();
  TextEditingController sessionNote = TextEditingController();
  double sessionRate = 50;
  bool isOverTime = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Insert Session")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Courses",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: courses.length,
                    reverse: true,
                    itemExtent: MediaQuery.of(context).size.height * 0.2,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCourse = index;
                          });
                        },
                        child: coursesCards(index, context),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text("Duration",
                    style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(
                  height: 10,
                ),
                durationWidgetsBuilder(context),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Date : ",
                          style: Theme.of(context).textTheme.labelMedium),
                      TextSpan(
                          text: DateFormat.MMMMEEEEd().format(DateTime.now()),
                          style: Theme.of(context).textTheme.displaySmall)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                givenMaterialWidgetBuilder(context),
                const SizedBox(
                  height: 20,
                ),
                sessionNoteWidgetBuilder(context),
                const SizedBox(
                  height: 20,
                ),
                sessionRateSliderBuilder(context),
                Row(
                  children: [
                    Text("OverTime : ",
                        style: Theme.of(context).textTheme.labelMedium),
                    Switch(
                      value: isOverTime,
                      onChanged: (value) {
                        setState(() {
                          isOverTime = value;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      String validator = insertValidation(customDuration.text,
                          selectedCourse, selectedDuration);
                      if (validator == "-1") {
                        context.read<BioAuthCubit>().authFun();
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('OOPS ...!!!'),
                                  content: Text(validator),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Center(child: Text('OK')),
                                    ),
                                  ],
                                ));
                      }
                    },
                    child: const Text("Insert"))
              ]),
        ),
      ),
    );
  }

  Column sessionRateSliderBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "Session Rate  ",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          TextSpan(
            text: sessionRate.round().toString(),
            style: Theme.of(context).textTheme.displaySmall,
          )
        ])),
        Slider(
          max: 100,
          min: 0,
          label: sessionRate.round().toString(),
          divisions: 20,
          value: sessionRate,
          onChanged: (value) {
            setState(() {
              sessionRate = value;
            });
          },
        ),
      ],
    );
  }

  Card coursesCards(int index, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: selectedCourse == index
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary,
              width: 2.0),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(courses[index].courseID.toString()),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          Text(
            "Subject name ",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            "Student name ",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            "online",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          )
        ],
      ),
    );
  }

  Padding durationWidgetsBuilder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDuration = 1;
                    customDuration.text = "";
                  });
                },
                child: chips(context, 1),
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDuration = 1.5;
                      customDuration.text = "";
                    });
                  },
                  child: chips(context, 1.5)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDuration = 2;
                      customDuration.text = "";
                    });
                  },
                  child: chips(context, 2)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDuration = 3;
                      customDuration.text = "";
                    });
                  },
                  child: chips(context, 3)),
            ],
          ),
          SizedBox(
            height: 30,
            width: 30,
            child: Row(
              children: [
                Text(
                  "Custom :",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: Theme.of(context).textTheme.labelMedium,
                    onChanged: (value) {
                      customDuration.text = value;
                    },
                    controller: customDuration,
                    keyboardType: TextInputType.number,
                    onTap: () {
                      setState(() {
                        selectedDuration = -1;
                      });
                    },
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), suffix: Text("hours")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Chip chips(BuildContext context, double lable) {
    return Chip(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: selectedDuration == lable
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary),
          borderRadius: BorderRadius.circular(10)),
      label: Text(
        "$lable/h",
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  Column givenMaterialWidgetBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Given Material",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        TextField(
          controller: sessionNote,
          onChanged: (value) {
            setState(() {
              if (value == "") {
                sessionNote.text = "Nothing written";
              } else {
                sessionNote.text = value;
              }
            });
          },
          decoration: InputDecoration(
              hintText: "what we study ?",
              hintStyle: Theme.of(context).textTheme.displaySmall),
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }

  Column sessionNoteWidgetBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Note",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        TextField(
          controller: givenMaterial,
          onChanged: (value) {
            setState(() {
              if (value == "") {
                givenMaterial.text = "Nothing written";
              } else {
                givenMaterial.text = value;
              }
            });
          },
          decoration: InputDecoration(
              hintText: "provide a note  ?",
              hintStyle: Theme.of(context).textTheme.displaySmall),
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }

  String insertValidation(
      String customDuration, int selectedCourse, double duration) {
    if (selectedCourse == -1 && duration == -1 && customDuration == "") {
      return "$No_Selected_Course_CHECK_MESSAGE\n$No_Selected_Duration_CHECK_MESSAGE";
    }
    if (selectedCourse == -1) {
      return No_Selected_Course_CHECK_MESSAGE;
    }
    if (duration == -1 && customDuration == "") {
      return No_Selected_Duration_CHECK_MESSAGE;
    } else {
      return "-1";
    }
  }
}
