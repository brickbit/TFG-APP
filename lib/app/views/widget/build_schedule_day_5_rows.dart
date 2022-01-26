
import 'package:flutter/material.dart';
import 'build_schedule_header_hour.dart';
import 'drag_target_subject.dart';

Widget buildScheduleDay5Rows(int index) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildScheduleHeaderHour(5),
        Column(
          children: [
            SizedBox(
                width: 1100,
                height: 20,
                child: Row(
                  children: [
                    _dayCell('Lunes'),
                    _dayCell('Martes'),
                    _dayCell('Miércoles'),
                    _dayCell('Jueves'),
                    _dayCell('Viernes')
                  ],
                )),
            SizedBox(
              width: 1100,
              height: 595,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 9.18,
                ),
                primary: false,
                itemCount: 120,
                itemBuilder: (BuildContext context, int index) {
                  return const DragTargetSubject();
                },
              ),
            )
          ],
        )
      ],);
}

Widget _dayCell(String day){
  return Container(
    height: 30.0,
    width: 1100 / 5,
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        )),
    child: Center(
      child: Text(day),
    ),
  );
}