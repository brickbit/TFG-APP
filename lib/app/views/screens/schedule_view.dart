
import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:tfg_app/app/views/widget/schedule_dialog.dart';
import 'package:get/get.dart';

class ScheduleView extends GetView<HomeController> {

  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _scheduleView();
          } else {
            return _scheduleView();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => scheduleDialog('Create Schedule', controller.degrees.value),
      ),
    );
  }

  Widget _scheduleView() {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Schedules'),
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}

