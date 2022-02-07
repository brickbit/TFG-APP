import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:tfg_app/app/views/widget/department_dialog.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/views/widget/department_tile.dart';

class DepartmentListView extends GetView<HomeController> {
  const DepartmentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: Text('department'.tr),
              ),
              body: SafeArea(
                child: _listDepartment(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('department'.tr),
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

  Widget _listDepartment() {
    return controller.obx((data) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  departmentTile(
                      MediaQuery.of(context).size.width < 600, data?.departments ?? [], index),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          departmentDialog(data?.departments[index], 'editDepartment'.tr).then(
                                (value) {
                              if (value != null) {
                                controller.updateDepartment(value);
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
                          controller.deleteDepartment(data?.departments[index].id ?? -1);
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
          itemCount: data?.departments.length ?? 0);
    });
  }
}