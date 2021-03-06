import 'package:flutter/material.dart';
import 'package:meet_scheduler/Screens/wrapper.dart';
import 'package:meet_scheduler/timetable.dart';
import 'meetscheduler.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meet Scheduler",
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        'home': (BuildContext context) => MeetScheduler(),
        'timetable': (BuildContext context) => TimeTable(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF08BCA6),
        title: Text('Meet Scheduler'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Timetable'),
              onTap: () {
                Navigator.of(context).popAndPushNamed('timetable');
              },
            ),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: MeetScheduler(),
    );
  }
}
