
import 'package:flutter/material.dart';

Widget buildScheduleHeaderHour(int numRows) {
  return Column(children: [
    if (numRows == 15)
      _buildHour('', 20),
    _buildHour('',20),
    _buildHour('8:30',575/24),
    _buildHour('9:00',575/24),
    _buildHour('9:30',575/24),
    _buildHour('10:00',575/24),
    _buildHour('10:30',575/24),
    _buildHour('11:00',575/24),
    _buildHour('11:30',575/24),
    _buildHour('12:00',575/24),
    _buildHour('12:30',575/24),
    _buildHour('13:00',575/24),
    _buildHour('13:30',575/24),
    _buildHour('14:00',575/24),
    _buildHour('15:30',575/24),
    _buildHour('16:00',575/24),
    _buildHour('16:30',575/24),
    _buildHour('17:00',575/24),
    _buildHour('17:30',575/24),
    _buildHour('18:00',575/24),
    _buildHour('18:30',575/24),
    _buildHour('19:00',575/24),
    _buildHour('19:30',575/24),
    _buildHour('20:00',575/24),
    _buildHour('20:30',575/24),
    _buildHour('21:00',575/24),
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
