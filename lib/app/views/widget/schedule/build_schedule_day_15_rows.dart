import 'package:flutter/material.dart';
import '../../../model/day.dart';
import 'build_schedule_header_hour.dart';
import 'drag_target_subject.dart';

Widget buildScheduleDay15Rows(bool mobile, bool morning) {
  return ListView(
    primary: false,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    children: [
      buildMonday(mobile, morning),
      const SizedBox(
        width: 16,
      ),
      buildTuesday(mobile, morning),
      const SizedBox(
        width: 16,
      ),
      buildWednesday(mobile, morning),
      const SizedBox(
        width: 16,
      ),
      buildThursday(mobile, morning),
      const SizedBox(
        width: 16,
      ),
      buildFriday(mobile, morning),
    ],
  );
}

Widget buildMonday(bool mobile, bool morning) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildScheduleHeaderHour(5, mobile, morning),
      Column(
        children: [
          SizedBox(
            width: mobile ? 380 : 380,
            height: 40,
            child: _dayCell('Lunes', mobile),
          ),
          SizedBox(
            width: mobile ? 380 : 380,
            height: mobile ? 438 : 438,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: mobile ? 3.51 : 3.475,
                ),
                primary: false,
                itemCount: 36,
                itemBuilder: (BuildContext context, int index) {
                  return DragTargetSubject(
                    column: index ~/ 3,
                    row: index % 3,
                    morning: morning,
                    day: Day.monday
                  );
                }),
          )
        ],
      )
    ],
  );
}

Widget buildTuesday(bool mobile, bool morning) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildScheduleHeaderHour(5, mobile, morning),
      Column(
        children: [
          SizedBox(
            width: mobile ? 380 : 380,
            height: 40,
            child: _dayCell('Martes', mobile),
          ),
          SizedBox(
            width: mobile ? 380 : 380,
            height: mobile ? 438 : 438,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: mobile ? 3.51 : 3.475,
                ),
                primary: false,
                itemCount: 36,
                itemBuilder: (BuildContext context, int index) {
                  return DragTargetSubject(
                    column: index ~/ 3,
                    row: index % 3,
                    morning: morning,
                    day: Day.tuesday,
                  );
                }),
          )
        ],
      )
    ],
  );
}

Widget buildWednesday(bool mobile, bool morning) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildScheduleHeaderHour(5, mobile, morning),
      Column(
        children: [
          SizedBox(
            width: mobile ? 380 : 380,
            height: 40,
            child: _dayCell('Miércoles', mobile),
          ),
          SizedBox(
            width: mobile ? 380 : 380,
            height: mobile ? 438 : 438,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: mobile ? 3.51 : 3.475,
                ),
                primary: false,
                itemCount: 36,
                itemBuilder: (BuildContext context, int index) {
                  return DragTargetSubject(
                    column: index ~/ 3,
                    row: index % 3,
                    morning: morning,
                    day: Day.wednesday
                  );
                }),
          )
        ],
      )
    ],
  );
}

Widget buildThursday(bool mobile, bool morning) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildScheduleHeaderHour(5, mobile, morning),
      Column(
        children: [
          SizedBox(
            width: mobile ? 380 : 380,
            height: 40,
            child: _dayCell('Jueves', mobile),
          ),
          SizedBox(
            width: mobile ? 380 : 380,
            height: mobile ? 438 : 438,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: mobile ? 3.51 : 3.475,
                ),
                primary: false,
                itemCount: 36,
                itemBuilder: (BuildContext context, int index) {
                  return DragTargetSubject(
                    column: index ~/ 3,
                    row: index % 3,
                    morning: morning,
                    day: Day.thursday
                  );
                }),
          )
        ],
      )
    ],
  );
}

Widget buildFriday(bool mobile, bool morning) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildScheduleHeaderHour(5, mobile, morning),
      Column(
        children: [
          SizedBox(
            width: mobile ? 380 : 380,
            height: 40,
            child: _dayCell('Viernes', mobile),
          ),
          SizedBox(
            width: mobile ? 380 : 380,
            height: mobile ? 438 : 438,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: mobile ? 3.51 : 3.475,
                ),
                primary: false,
                itemCount: 36,
                itemBuilder: (BuildContext context, int index) {
                  return DragTargetSubject(
                    column: index ~/ 3,
                    row: index % 3,
                    morning: morning,
                    day: Day.friday
                  );
                }),
          )
        ],
      )
    ],
  );
}

Widget _dayCell(String day, bool mobile) {
  return Container(
    height: mobile ? 50.0 : 50.0,
    width: mobile ? 750 / 3 : 700 / 3,
    decoration: BoxDecoration(
        border: Border.all(
      color: Colors.black,
    )),
    child: Center(
      child: Text(day),
    ),
  );
}
