
import 'package:flutter/material.dart';

Widget buildScheduleHeaderHour(int numRows, bool mobile, bool morning) {
  return Column(children: [
    if (numRows == 15)
      _buildHour('', 20),
    _buildHour('',mobile ? 40 : 40),
    _buildHour(morning ? '8:30' : '15:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '9:00' : '16:00',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '9:30' : '16:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '10:00' : '17:00',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '10:30' : '17:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '11:00' : '18:00',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '11:30' : '18:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '12:00' : '19:00',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '12:30' : '19:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '13:00' : '20:00',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '13:30' : '20:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour(morning ? '14:00' : '21:00',mobile ? 440/12.2 : 575/14.38),
  ]);
}

Widget _buildHour(String hour, double height) {
  return SizedBox(
    width: 50,
    height: height,
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          )),
      child: Center(child: Text(hour)),
    ),
  );
}
