import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/department_controller.dart';
import 'package:tfg_app/app/views/widget/department_dialog.dart';
import 'package:get/get.dart';
import 'package:tfg_app/data/model/department_model.dart';

class DepartmentListView extends GetView<DepartmentController> {
  const DepartmentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Departments'),
              ),
              body: SafeArea(
                child: _listDepartment(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Departments'),
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
    return controller.obx((listDepartment) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _showContent(
                      MediaQuery.of(context).size.width < 600, listDepartment, index),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          departmentDialog(listDepartment[index], 'Edit Department').then(
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
                          controller.deleteDepartment(listDepartment[index].id);
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
          itemCount: listDepartment.length);
    });

  }

  Widget _showContent(bool mobile, List<DepartmentModel> departments, int index) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobile) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(departments[index].name!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  departments[index].acronym!,
                ),
              ],
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    departments[index].name!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    departments[index].acronym!,
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}