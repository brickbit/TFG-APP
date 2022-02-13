import 'package:flutter/material.dart';
import '../../../model/day.dart';
import 'build_schedule_header_hour.dart';
import 'drag_target_subject.dart';

Widget buildScheduleDay5Rows(bool mobile, bool morning) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildScheduleHeaderHour(5, mobile, morning),
      Column(
        children: [
          SizedBox(
              width: mobile ? 750 : 1100,
              height: 40,
              child: Row(
                children: [
                  _dayCell('Lunes', mobile),
                  _dayCell('Martes', mobile),
                  _dayCell('Miércoles', mobile),
                  _dayCell('Jueves', mobile),
                  _dayCell('Viernes', mobile)
                ],
              )),
          SizedBox(
            width: mobile ? 750 : 1100,
            height: mobile ? 440 : 530,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: mobile ? 4.16 : 6.03,
              ),
              primary: false,
              itemCount: 60,
              itemBuilder: (BuildContext context, int index) {
                return DragTargetSubject(
                  column: index ~/ 5,
                  row: index % 5,
                  morning: morning,
                  day: Day.none,
                );
              },
            ),
          )
        ],
      )
    ],
  );
}

Widget _dayCell(String day, bool mobile) {
  return Container(
    height: mobile ? 50.0 : 50.0,
    width: mobile ? 750/5 : 1100 / 5,
    decoration: BoxDecoration(
        border: Border.all(
      color: Colors.black,
    )),
    child: Center(
      child: Text(day),
    ),
  );
}
