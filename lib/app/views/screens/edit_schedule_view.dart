import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/model/schedule_features_model.dart';

class EditScheduleView extends GetView<HomeController> {

  final ScheduleFeaturesModel features = Get.arguments;
  EditScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Edit schedule'),
              ),
              body: SafeArea(
                child: features.scheduleType == 'One subject per hour' ? oneSubjectPerHourView() : severalSubjectsPerHourView(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Edit schedule'),
              ),
              body: SafeArea(
                child: features.scheduleType == 'One subject per hour' ? oneSubjectPerHourView() : severalSubjectsPerHourView(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget oneSubjectPerHourView() {
    return Container(color: Colors.red,);
  }

  Widget severalSubjectsPerHourView() {
    return Container(color: Colors.blue,);
  }
}