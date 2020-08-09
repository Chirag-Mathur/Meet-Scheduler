import 'package:flutter/material.dart';
import 'package:meet_scheduler/Screens/wrapper.dart';
import 'meetscheduler.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MeetScheduler(),
    );
  }
}
