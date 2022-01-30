
import 'package:flutter/material.dart';

Widget buildScheduleHeaderHour(int numRows, bool mobile) {
  return Column(children: [
    if (numRows == 15)
      _buildHour('', 20),
    _buildHour('',mobile ? 40 : 40),
    _buildHour('8:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour('9:00',mobile ? 440/12.2 : 575/14.38),
    _buildHour('9:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour('10:00',mobile ? 440/12.2 : 575/14.38),
    _buildHour('10:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour('11:00',mobile ? 440/12.2 : 575/14.38),
    _buildHour('11:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour('12:00',mobile ? 440/12.2 : 575/14.38),
    _buildHour('12:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour('13:00',mobile ? 440/12.2 : 575/14.38),
    _buildHour('13:30',mobile ? 440/12.2 : 575/14.38),
    _buildHour('14:00',mobile ? 440/12.2 : 575/14.38),
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
