
import 'package:flutter/material.dart';

Widget buildScheduleHeaderHour(int numRows) {
  return Column(children: [
    if (numRows == 15)
      _buildHour('', 20),
    _buildHour('',40),
    _buildHour('8:30',575/14.38),
    _buildHour('9:00',575/14.38),
    _buildHour('9:30',575/14.38),
    _buildHour('10:00',575/14.38),
    _buildHour('10:30',575/14.38),
    _buildHour('11:00',575/14.38),
    _buildHour('11:30',575/14.38),
    _buildHour('12:00',575/14.38),
    _buildHour('12:30',575/14.38),
    _buildHour('13:00',575/14.38),
    _buildHour('13:30',575/14.38),
    _buildHour('14:00',575/14.38),
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
