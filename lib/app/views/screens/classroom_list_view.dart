import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:tfg_app/app/views/widget/classroom_dialog.dart';
import 'package:tfg_app/app/views/widget/classroom_tile.dart';
import 'package:get/get.dart';

class ClassroomListView extends GetView<HomeController> {
  const ClassroomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: Text('classroom'.tr),
              ),
              body: SafeArea(
                child: _listClassroom(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('classroom'.tr),
              ),
              body: SafeArea(
                child: Column(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _listClassroom() {
    return controller.obx((data) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  classroomTile(MediaQuery.of(context).size.width < 600,
                      data?.classrooms ?? [], index),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          classroomDialog(data?.classrooms[index], 'editClassroom'.tr)
                              .then(
                            (value) {
                              if (value != null) {
                                controller.updateClassroom(value);
                                controller.update();
                              }
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          controller.deleteClassroom(data?.classrooms[index].id ?? -1);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
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
          itemCount: data?.classrooms.length ?? 0);
    });
  }
}
