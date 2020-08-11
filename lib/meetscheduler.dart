import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MeetScheduler extends StatefulWidget {
  @override
  _MeetSchedulerState createState() => _MeetSchedulerState();
}

class _MeetSchedulerState extends State<MeetScheduler> {
  String finalDate = '';
  var _classlink = {
    '180': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',
    '190': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '11015': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '11115': 'https://meet.google.com/duz-vzzh-rso?pli=1&authuser=1',
    
    '280': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '290': 'https://meet.google.com/nxy-ydba-kzr?pli=1&authuser=1',
    '21015': 'https://meet.google.com/gov-hpkt-xgq?pli=1&authuser=1',
    '21115': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',

    '380': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '390': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '31015': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '31115': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',

    '480': 'https://meet.google.com/nxy-ydba-kzr?pli=1&authuser=1',
    '490': 'https://meet.google.com/gov-hpkt-xgq?pli=1&authuser=1',
    '41015': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',
    '41115': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',

    '580': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '590': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '51015': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '51115': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
  };

  var _classname = {
    '180': 'EC 201 (KKJ ki Class)',
    '190': 'MA201',
    '11015': 'CS203(Algo Class)',
    '11115': 'Amandeep ke Class hai',

    '280': 'CS201(OOPS Class)',
    '290': 'EVS(Section 1)',
    '21015': 'EVS(Section 2)',
    '21115': 'EC 201 (KKJ ki Class)',

    '380': 'MA201',
    '390': 'CS203(Algo Class)',
    '31015': 'CS201(OOPS Class)(DSS)',
    '31115': 'CS201(OOPS Class)',
    
    '480': 'EVS(Section 1)',
    '490': 'EVS(Section 2)',
    '41015': 'EC 201 (KKJ ki Class)',
    '41115': 'MA201',

    '580': 'CS203(Algo Class)',
    '590': 'CS203(Algo Class)(DSS)',
    '51015': 'CS201(OOPS Class)',
    '51115': 'CS201(OOPS Class)(DSS)',
  };

  // var _titlename = {'801': 'Section 1', '802': 'Section 2', ''};

  String getCurrentDate() {
    TimeOfDay t = TimeOfDay.now();
    var now = new DateTime.now();
    var h = t.hour;
    var min = t.minute;
    var week = now.weekday;
    week = week < 6 ? week : 1;
    print(week);

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
    var date = new DateTime(week, h, min).toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${week}${h}${min}";
    //var formattedDate = "${t.hour}";

    setState(() {
      finalDate = formattedDate;
    });
    print(finalDate);
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
    return Center(
      child: int.parse(getCurrentDate().substring(1)) <= 1115
          ? RaisedButton(
              onPressed: _launchURL,
              child: Text(_classname[getCurrentDate()]),
            )
          : Text('No more theory class today'),
    );
  }
}
