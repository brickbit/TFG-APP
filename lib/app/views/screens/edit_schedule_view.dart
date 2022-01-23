import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/model/schedule_features_model.dart';
import 'package:tfg_app/app/views/widget/drag_list_subjects.dart';
import 'package:tfg_app/app/views/widget/subject_box.dart';
import 'package:tfg_app/data/model/subject_model.dart';

class EditScheduleView extends GetView<HomeController> {
  final ScheduleFeaturesModel features = Get.arguments;
  EditScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) => Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Edit schedule'),
              ),
              body: SafeArea(
                child: features.scheduleType == 'One subject per hour'
                    ? oneSubjectPerHourView(data?.subjects ?? [])
                    : severalSubjectsPerHourView(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Edit schedule'),
              ),
              body: SafeArea(
                child: features.scheduleType == 'One subject per hour'
                    ? oneSubjectPerHourView(data?.subjects ?? [])
                    : severalSubjectsPerHourView(),
              ),
            );
          }
        }),
      ),
      onLoading: Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      onEmpty: Container(
        color: Colors.white,
        child: const Text('There is not data to load'),
      ),
    );
  }

  Widget oneSubjectPerHourView(List<SubjectModel> subjects) {
    List<SubjectBox> subjectBoxes = subjects.map((data) => data.toSubjectBox()).toList();
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(height: 615, child: Column() //buildDaySchedule5Rows(0)
            ),
      ])),
      dragListSubject(subjectBoxes)
    ]);
  }

  Widget severalSubjectsPerHourView() {
    return Container(
      color: Colors.blue,
    );
  }
}

extension ColorToMaterial on int {
  MaterialColor parseColor() {
    switch (this) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.amber;
      case 3:
        return Colors.green;
      case 4:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}


extension SubjectModelMapper on SubjectModel {
  SubjectBox toSubjectBox() {
    return SubjectBox(color: color.parseColor(), name: acronym ?? '', time: time);
  }
}