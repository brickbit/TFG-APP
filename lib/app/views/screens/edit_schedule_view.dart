import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/schedule_controller.dart';
import 'package:tfg_app/app/mappers/subject_model_mapper.dart';
import 'package:tfg_app/app/model/schedule_features_model.dart';
import 'package:tfg_app/app/views/widget/build_schedule_day_5_rows.dart';
import 'package:tfg_app/app/views/widget/material_dropdown.dart';
import 'package:tfg_app/app/views/widget/subject_box.dart';

class EditScheduleView extends GetView<ScheduleController> {
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
                    ? oneSubjectPerHourView(true)
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
                    ? oneSubjectPerHourView(false)
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

  Widget oneSubjectPerHourView(bool mobile) {
    var _shift = 'Mañana'.obs;
    return Obx(
      () => Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: materialDropdown(_shift, ['Mañana', 'Tarde']),
              ),
              Stack(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: mobile
                              ? SizedBox(
                                  height: 480,
                                  child: buildScheduleDay5Rows(
                                      mobile, _shift.value == 'Mañana'))
                              : SizedBox(
                                  height: 615,
                                  child: buildScheduleDay5Rows(
                                      mobile, _shift.value == 'Mañana')),
                        ),
                      ]),
                ),
              ]),
            ],
          ),
        )),
        controller.obx((data) {
          return dragListSubject();
        })
      ]),
    );
  }

  Widget dragListSubject() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          height: 65,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            height: 50.0,
            child: controller.obx(
              (state) => ListView.separated(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.subjects.value.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 70,
                    height: 50,
                    child: Draggable<SubjectBox>(
                      data: controller.subjects.value
                          .map((data) => data.toSubjectBox())
                          .toList()[index],
                      child: controller.subjects.value
                          .map((data) => data.toSubjectBox())
                          .toList()[index],
                      feedback: controller.subjects.value
                          .map((data) => data.toSubjectBox())
                          .toList()[index],
                      onDragCompleted: () {
                        var item = controller.subjects.value.firstWhere(
                            (element) =>
                                controller.subjects.value
                                    .map((data) => data.toSubjectBox())
                                    .toList()[index]
                                    .subject
                                    .id ==
                                element.id);
                        var pos = controller.subjects.value.indexOf(item);
                        controller.subjects.value[pos] =
                            item.copyWith(newTime: item.time - 30);
                        if (controller.subjects.value[pos].time == 0) {
                          controller.subjects.value.removeAt(pos);
                        }
                        controller.update();
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget severalSubjectsPerHourView() {
    return Container(
      color: Colors.blue,
    );
  }
}
