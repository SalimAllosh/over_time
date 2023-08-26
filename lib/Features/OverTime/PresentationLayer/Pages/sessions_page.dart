import 'package:flutter/material.dart';

class SessionsPage extends StatelessWidget {
  const SessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sessions")),
      body: SingleChildScrollView(
        child: Column(
          children: [Text("filter Here ")],
        ),
      ),
    );
  }
}
