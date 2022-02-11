import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/schedule_controller.dart';
import 'package:tfg_app/app/extension/color_extension.dart';
import 'package:tfg_app/app/views/widget/schedule/subject_box.dart';
import 'package:tfg_app/data/model/subject_model.dart';

class DragTargetSubject extends GetView<ScheduleController> {
  final int row;
  final int column;
  final bool morning;
  const DragTargetSubject(
      {Key? key,
      required this.row,
      required this.column,
      required this.morning})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var acceptedData = morning
        ? controller.morning5Rows.value[column][row]
        : controller.afternoon5Rows.value[column][row];
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
        controller.completeDrag(item, morning, row, column);
      },
    );
  }
}
