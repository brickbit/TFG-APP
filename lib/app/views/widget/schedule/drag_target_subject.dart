import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/schedule_controller.dart';
import 'package:tfg_app/app/extension/color_extension.dart';
import 'package:tfg_app/app/views/widget/schedule/subject_box.dart';

import '../../../../data/model/subject_model.dart';
import '../../../model/day.dart';

class DragTargetSubject extends GetView<ScheduleController> {
  final int row;
  final int column;
  final bool morning;
  final Day day;
  const DragTargetSubject(
      {Key? key,
      required this.row,
      required this.column,
      required this.morning,
      required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var acceptedData = getAcceptedData(day, morning);
    return DragTarget<SubjectBox>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return Container(
          height: 20.0,
          width: 60.0,
          decoration: BoxDecoration(
              color: acceptedData?.color.parseColor() ?? Colors.white,
              border: Border.all(
                color: Colors.black,
              )),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    acceptedData?.acronym ?? '',
                    style: const TextStyle(fontSize: 12),
                  ),
                  acceptedData?.seminary == true
                      ? const Icon(Icons.emoji_people_sharp, color: Colors.black45,size: 20,)
                      : const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  acceptedData?.laboratory == true
                      ? const Icon(Icons.science_sharp, color: Colors.black45,size: 20,)
                      : const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  acceptedData?.english == true
                      ? const Icon(Icons.flag, color: Colors.black45,size: 20,)
                      : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
                  acceptedData != null
                      ? IconButton(
                          onPressed: () {
                            controller.restoreItem(row, column, morning);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.black45,
                          ),
                        )
                      : Container()
                ]),
          ),
        );
      },
      onAccept: (SubjectBox data) {
        var item = data.subject.selectItem(newDay: row, newHour: column);
        controller.completeDrag(item, morning, row, column, day);
      },
    );
  }

  SubjectModel? getAcceptedData(Day day, bool morning) {
    switch (day) {
      case Day.monday:
        return morning ? controller.morningMonday5Rows.value[column][row] : controller.afternoonMonday5Rows.value[column][row];
      case Day.tuesday:
        return morning ? controller.morningTuesday5Rows.value[column][row] : controller.afternoonTuesday5Rows.value[column][row];
      case Day.wednesday:
        return morning ? controller.morningWednesday5Rows.value[column][row] : controller.afternoonWednesday5Rows.value[column][row];
      case Day.thursday:
        return morning ? controller.morningThursday5Rows.value[column][row] : controller.afternoonThursday5Rows.value[column][row];
      case Day.friday:
        return morning ? controller.morningFriday5Rows.value[column][row] : controller.afternoonFriday5Rows.value[column][row];
      case Day.none:
        return morning ? controller.morning5Rows.value[column][row] : controller.afternoon5Rows.value[column][row];
    }
  }
}
