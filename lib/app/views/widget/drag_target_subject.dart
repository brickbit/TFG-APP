import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/schedule_controller.dart';
import 'package:tfg_app/app/extension/color_extension.dart';
import 'package:tfg_app/app/views/widget/subject_box.dart';

class DragTargetSubject extends StatefulWidget {
  const DragTargetSubject({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DragTargetSubjectState();
}

class _DragTargetSubjectState extends State<DragTargetSubject> {
  SubjectBox? acceptedData;

  @override
  Widget build(BuildContext context) {
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
              color: acceptedData?.subject.color.parseColor() ?? Colors.white,
              border: Border.all(
                color: Colors.black,
              )),
          child: Center(
            child: Text(
              acceptedData?.subject.name ?? '',
              style: const TextStyle(fontSize: 12),
            ),
          ),
        );
      },
      onAccept: (SubjectBox data) {
        setState(() {
          var subject = SubjectBox(
              subject: data.subject.copyWith(newTime: data.subject.time - 30));
          acceptedData = subject;
        });
      },
    );
  }
}

class DragTargetSubject2 extends GetView<ScheduleController> {
  const DragTargetSubject2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var acceptedData = controller.dragSubject.value;
    return Obx(
      () => DragTarget<SubjectBox>(
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            height: 20.0,
            width: 60.0,
            decoration: BoxDecoration(
                color: acceptedData?.subject.color.parseColor() ?? Colors.white,
                border: Border.all(
                  color: Colors.black,
                )),
            child: Center(
              child: Text(
                acceptedData?.subject.name ?? '',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          );
        },
        onAccept: (SubjectBox data) {
          controller.dragSubject.value = data;
        },
      ),
    );
  }
}
