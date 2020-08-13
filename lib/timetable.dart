import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Table'),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: AssetImage('Assets/Images/timetable.jpg'),
        ),
      ),
    );
  }
}
