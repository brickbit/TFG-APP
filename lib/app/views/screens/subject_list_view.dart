import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/views/widget/dialog/subject_dialog.dart';

import '../widget/tiles/subject_tile.dart';

class SubjectListView extends GetView<HomeController> {
  const SubjectListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: Text('subject'.tr),
              ),
              body: SafeArea(
                child: _listSubject(constraints.maxWidth < 600),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('subject'.tr),
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

  Widget _listSubject(bool mobile) {
    return controller.obx((data) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  subjectTile(MediaQuery.of(context).size.width < 600,
                      data?.subjects ?? [], index),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          subjectDialog(mobile, data?.subjects[index], 'editSubject'.tr,
                                  controller)
                              .then(
                            (value) {
                              if (value != null) {
                                controller.updateSubject(value);
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
                          controller
                              .deleteSubject(data?.subjects[index].id ?? -1);
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
          itemCount: data?.subjects.length ?? 0);
    });
  }
}
