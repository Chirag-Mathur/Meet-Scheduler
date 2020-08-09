import 'package:flutter/material.dart';
import 'package:meet_scheduler/Screens/Authenticate/authenticate.dart';
import 'package:meet_scheduler/Screens/Home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
    );
  }
}