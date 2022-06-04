import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:tfg_app/app/views/widget/dialog/schedule_dialog.dart';
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
        onPressed: () =>
            scheduleDialog('createSchedule'.tr, controller.degrees.value),
      ),
    );
  }

  Widget _scheduleView() {
    return controller.obx((data) {
      return Scaffold(
        appBar: AppBar(
          title: Text('schedule'.tr),
        ),
        body: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data!.schedules[index].degree),
                        Text(data.schedules[index].year)
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller
                                  .deleteSchedule(data.schedules[index].id!);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SizedBox(
                    height: 1,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                );
              },
              itemCount: data?.schedules.length ?? 0),
        ),
      );
    });
  }
}
