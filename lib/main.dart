import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

void main() => runApp(MeetScheduler());

class MeetScheduler extends StatefulWidget {
  @override
  _MeetSchedulerState createState() => _MeetSchedulerState();
}

class _MeetSchedulerState extends State<MeetScheduler> {
  String finalDate = '';
  var _classlink = {
    '580': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '590': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '51015': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '51115': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
  };

  var _classname = {
    '580': 'CS203(Algo Class)',
    '590': 'CS203(Algo Class)(DSS)',
    '51015': 'CS201(OOPS Class)',
    '51115': 'CS201(OOPS Class)(DSS)',
  };

  String getCurrentDate() {
    TimeOfDay t = TimeOfDay.now();
    var now = new DateTime.now();
    var h = t.hour;
    var min = t.minute;
    if (h <= 7 || h == 8 && min <= 55) {
      min = 00;
      h = 8;
    } else if (h <= 8 || h == 9 && min <= 55) {
      h = 9;
      min = 0;
    } else if (h <= 10 || h == 11 && min <= 10) {
      h = 10;
      min = 15;
    } else if (h <= 11 || h == 11 && min <= 10) {
      h = 11;
      min = 15;
    }
    var date = new DateTime(now.weekday, h, min).toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${now.weekday}${h}${min}";
    //var formattedDate = "${t.hour}";

    setState(() {
      finalDate = formattedDate;
    });
    return finalDate;
  }

  var url;
  String idd;
  _launchURL() async {
    idd = getCurrentDate();
    setState(() {
      url = _classlink[idd];
    });

    //print(_classlink[finalDate]);
    print(idd);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Meet Scheduler'),
        ),
        body: new Center(
          child: RaisedButton(
            onPressed: _launchURL,
            child: Text(_classname[getCurrentDate()]),
          ),
        ),
      ),
    );
  }
}
