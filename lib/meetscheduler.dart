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
  String finalDate2 = '';
  var _classlink = {
    '180': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',
    '190': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '11015': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '11115': 'https://meet.google.com/duz-vzzh-rso?pli=1&authuser=1',
    '11330': 'https://meet.google.com/jzh-qjhb-sbh?pli=1&authuser=1',
    '11430': 'https://meet.google.com/jzh-qjhb-sbh?pli=1&authuser=1',
    '11530': 'https://meet.google.com/jzh-qjhb-sbh?pli=1&authuser=1',
    '280': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '290': 'https://meet.google.com/nxy-ydba-kzr?pli=1&authuser=1',
    '21015': 'https://ibb.co/5jCx3z0',
    '21115': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',
    '21330': 'https://meet.google.com/bwb-fdej-urt?pli=1&authuser=1',
    '21430': 'https://meet.google.com/bwb-fdej-urt?pli=1&authuser=1',
    '21530': 'https://meet.google.com/bwb-fdej-urt?pli=1&authuser=1',
    '380': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '390': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '31015': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '31115': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '31330': 'https://meet.google.com/imc-ywre-mnx?pli=1&authuser=1',
    '31430': 'https://meet.google.com/imc-ywre-mnx?pli=1&authuser=1',
    '31530': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',
    '480': 'https://meet.google.com/nxy-ydba-kzr?pli=1&authuser=1',
    '490': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '41015': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',
    '41115': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '41330': 'https://meet.google.com/naj-hdto-vfj?authuser=1',
    '41430': 'https://classroom.google.com/u/1/c/MTE4NjI4NTQ5NjUw',
    '41530': 'https://classroom.google.com/u/1/c/MTE4NjI4NTQ5NjUw',
    '580': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '590': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '51015': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '51115': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '51330': 'https://meet.google.com/jnm-pfbp-tpv?pli=1&authuser=1',
    '51430': 'https://meet.google.com/jnm-pfbp-tpv?pli=1&authuser=1',
    '51530': 'https://meet.google.com/jnm-pfbp-tpv?pli=1&authuser=1',
  };

  var _classname = {
    '180': 'EC 201 (KKJ ki Class)',
    '190': 'MA201',
    '11015': 'CS203(Algo Class)',
    '11115': 'Amandeep ke Class hai',
    '11330': 'CS261(OOPS Lab)(A & C)',
    '11430': 'CS261(OOPS Lab)(A & C)',
    '11530': 'CS261(OOPS Lab)(A & C)',
    '280': 'CS201(OOPS Class)',
    '290': 'EVS(Section 1)',
    '21015': 'NO Class for Section 1',
    '21115': 'EC 201 (KKJ ki Class)',
    '21330': 'CS263(Algo Lab)(A & C)',
    '21430': 'CS263(Algo Lab)(A & C)',
    '21530': 'CS263(Algo Lab)(A & C)',
    '380': 'MA201',
    '390': 'CS203(Algo Class)',
    '31015': 'CS201(OOPS Class)(DSS)',
    '31115': 'CS201(OOPS Class)',
    '31330': 'EC261(KKJ ki Lab)(Section 1)',
    '31430': 'EC261(KKJ ki Lab)(Section 1)',
    '31530': 'EC201(KKJ ki Doubt Class)(Section 1)',
    '480': 'EVS(Section 1)',
    '490': 'MA201 Tut',
    '41015': 'EC 201 (KKJ ki Class)',
    '41115': 'MA201',
    '41330': 'HS201 Tut(Section 1)',
    '41430': 'HS201 Lab(Section 1)',
    '41530': 'HS201 Lab(Section 1)',
    '580': 'CS203(Algo Class)',
    '590': 'CS203(Algo Class)(DSS)',
    '51015': 'CS201(OOPS Class)',
    '51115': 'MA 201(DSS)',
    '51330': 'EE160(DKS ki Lab)(Section 1)',
    '51430': 'EE160(DKS ki Lab)(Section 1)',
    '51530': 'EE160(DKS ki Lab)(Section 1)',
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
    } else if (h <= 11 || h == 12 && min <= 10) {
      h = 11;
      min = 15;
    } else if (h <= 13 || h == 14 && min <= 30) {
      h = 13;
      min = 30;
    } else if (h <= 14 || h == 15 && min <= 30) {
      h = 14;
      min = 30;
    } else if (h <= 15 || h == 16 && min <= 30) {
      h = 15;
      min = 30;
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

  var _classlink2 = {
    '180': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',
    '190': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '11015': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '11115': 'https://meet.google.com/duz-vzzh-rso?pli=1&authuser=1',
    '11330': 'https://meet.google.com/ent-wrxw-yqe?pli=1&authuser=1',
    '11430': 'https://meet.google.com/ent-wrxw-yqe?pli=1&authuser=1',
    '11530': 'https://meet.google.com/ent-wrxw-yqe?pli=1&authuser=1',
    '280': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '290': 'https://ibb.co/5jCx3z0',
    '21015': 'https://meet.google.com/gov-hpkt-xgq?pli=1&authuser=1',
    '21115': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',
    '21330': 'https://meet.google.com/auo-hjij-mwa?pli=1&authuser=1',
    '21430': 'https://meet.google.com/auo-hjij-mwa?pli=1&authuser=1',
    '21530': 'https://meet.google.com/auo-hjij-mwa?pli=1&authuser=1',
    '380': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '390': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '31015': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '31115': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '31330': 'https://meet.google.com/imc-ywre-mnx?pli=1&authuser=1',
    '31430': 'https://meet.google.com/imc-ywre-mnx?pli=1&authuser=1',
    '31530': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',
    '480': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '490': 'https://meet.google.com/gov-hpkt-xgq?pli=1&authuser=1',
    '41015': 'https://meet.google.com/rwy-cafc-zus?pli=1&authuser=1',
    '41115': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '41330': 'https://meet.google.com/jnm-pfbp-tpv?pli=1&authuser=1',
    '41430': 'https://meet.google.com/jnm-pfbp-tpv?pli=1&authuser=1',
    '41530': 'https://meet.google.com/jnm-pfbp-tpv?pli=1&authuser=1',
    '580': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '590': 'https://meet.google.com/jnr-zmjz-uko?pli=1&authuser=1',
    '51015': 'https://meet.google.com/edt-kaag-azn?pli=1&authuser=1',
    '51115': 'https://meet.google.com/yaf-untz-smm?pli=1&authuser=1',
    '51330': 'https://meet.google.com/naj-hdto-vfj?authuser=1',
    '51430': 'https://classroom.google.com/u/1/c/MTE4NjI4NTQ5NjUw',
    '51530': 'https://classroom.google.com/u/1/c/MTE4NjI4NTQ5NjUw',
  };

  var _classname2 = {
    '180': 'EC 201 (KKJ ki Class)',
    '190': 'MA201',
    '11015': 'CS203(Algo Class)',
    '11115': 'Amandeep ke Class hai',
    '11330': 'CS261(OOPS Lab)(B & D)',
    '11430': 'CS261(OOPS Lab)(B & D)',
    '11530': 'CS261(OOPS Lab)(B & D)',
    '280': 'CS201(OOPS Class)',
    '290': 'NO Class for Section 2',
    '21015': 'EVS(Section 2)',
    '21115': 'EC 201 (KKJ ki Class)',
    '21330': 'CS263(Algo Lab)(B & D)',
    '21430': 'CS263(Algo Lab)(B & D)',
    '21530': 'CS263(Algo Lab)(B & D)',
    '380': 'MA201',
    '390': 'CS203(Algo Class)',
    '31015': 'CS201(OOPS Class)(DSS)',
    '31115': 'CS201(OOPS Class)',
    '31330': 'EC261(KKJ ki Lab)(Section 2)',
    '31430': 'EC261(KKJ ki Lab)(Section 2)',
    '31530': 'EC201(KKJ ki Doubt Class)(Section 2)',
    '480': 'MA201 Tut',
    '490': 'EVS(Section 2)',
    '41015': 'EC 201 (KKJ ki Class)',
    '41115': 'MA201',
    '41330': 'EE160(DKS ki Lab)(Section 2)',
    '41430': 'EE160(DKS ki Lab)(Section 2)',
    '41530': 'EE160(DKS ki Lab)(Section 2)',
    '580': 'CS203(Algo Class)',
    '590': 'CS203(Algo Class)(DSS)',
    '51015': 'CS201(OOPS Class)',
    '51115': 'MA 201(DSS)',
    '51330': 'HS201 Tut(Section 2)',
    '51430': 'HS201 Lab(Section 2)',
    '51530': 'HS201 Lab(Section 2)',
  };

  // var _titlename = {'801': 'Section 1', '802': 'Section 2', ''};

  var url2;
  //String idd2;
  _launchURL2() async {
    idd = getCurrentDate();
    setState(() {
      url2 = _classlink2[idd];
    });

    //print(_classlink[finalDate]);
    print(idd);
    if (await canLaunch(url2)) {
      await launch(url2);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: int.parse(getCurrentDate().substring(1)) <= 1430
          ? _classname[getCurrentDate()] == _classname2[getCurrentDate()]
              ? RaisedButton(
                  onPressed: _launchURL,
                  child: Text(_classname[getCurrentDate()]),
                )
              : Container(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: _launchURL,
                      child: Text(_classname[getCurrentDate()]),
                    ),
                    RaisedButton(
                      onPressed: _launchURL2,
                      child: Text(_classname2[getCurrentDate()]),
                    )
                  ],
                ))
          : Text('No more class today'),
    );
  }
}
