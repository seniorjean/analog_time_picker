library analog_time_picker;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'analog_time_picker.dart';
import 'utils.dart';

class FullPageAnalogTimePicker extends StatelessWidget {
  final Map<String, dynamic>? mapData;
  final String? route;
  final Widget container;

  FullPageAnalogTimePicker({Key? key, this.mapData, this.container = const SizedBox(), this.route}) : super(key: key);

  Map<String, DateTime?> _dateTime = {};

  @override
  Widget build(BuildContext context) {
    print(mapData);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            container,
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50.0),
              child: AnalogTimePicker(
                onChanged: (value) {
                  getDayTime(value);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  print(_dateTime);
                  if (_dateTime['date'] != null && _dateTime['time'] != null) {
                    mapData!['date'] =
                        DateFormat.yMMMMd().format(_dateTime['date']!).toString();
                    mapData!['time'] =
                        DateFormat.jm().format(_dateTime['time']!).toString();
                    Navigator.pushNamed(context, '/sixth', arguments: mapData);
                  }
                },
              ),
            ),
            MyBackButton(),
          ],
        ),
      ),
    );
  }

  void getDayTime(Map<String, DateTime?> value) {
    _dateTime = value;
  }
}