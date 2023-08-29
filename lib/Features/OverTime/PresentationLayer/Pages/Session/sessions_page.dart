import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:over_time/Core/DummyData/session_list.dart';
import 'package:over_time/Core/Route/app_routes.dart';
import 'package:over_time/Core/Theme/app_colors.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/session_entity.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  bool filterd = false;
  List<SessionEntity> sessions = dummySessionList;
  List<SessionEntity> filtersessions = dummySessionList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sessions"),
        actions: [
          PopupMenuButton(
            icon: filterd
                ? const Icon(Icons.filter_list_outlined)
                : Icon(
                    Icons.filter_list_off_outlined,
                    color: primaryColor,
                  ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "Month",
                onTap: () {
                  setState(() {
                    filterd = !filterd;
                    filtersessions = sessions
                        .where((session) =>
                            session.sessionDate.month == DateTime.now().month)
                        .toList();
                  });
                },
                child: Text(
                  "Month",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              //to do
              PopupMenuItem(
                value: "Online",
                onTap: () {
                  setState(() {
                    filterd = !filterd;
                    filtersessions = sessions
                        .where((session) =>
                            session.sessionDate.month == DateTime.now().month)
                        .toList();
                  });
                },
                child: Text(
                  "Online",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              PopupMenuItem(
                value: "Offline",
                onTap: () {
                  setState(() {
                    filterd = !filterd;
                    filtersessions = sessions
                        .where((session) =>
                            session.sessionDate.month == DateTime.now().month)
                        .toList();
                  });
                },
                child: Text(
                  "Offline",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: filtersessions.length,
                itemBuilder: (context, index) => ListTile(
                  subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: primaryColor,
                              size: 15,
                            ),
                            Text(" ${filtersessions[index].duration}"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.subject_sharp,
                              color: primaryColor,
                              size: 15,
                            ),
                            const Text(" math"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person_pin_rounded,
                              color: primaryColor,
                              size: 15,
                            ),
                            const Text(" online"),
                          ],
                        ),
                      ]),
                  leading: Text(filtersessions[index].sessionID.toString()),
                  title: Text(
                    DateFormat('yMMMMEEEEd')
                        .format(filtersessions[index].sessionDate),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text("Generate Report"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.getInsertSessionPage());
          },
          child: const Icon(Icons.add)),
    );
  }
}
//Text("Duration : ${filtersessions[index].duration}")