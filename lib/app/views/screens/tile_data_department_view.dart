import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/department_controller.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';
import 'package:tfg_app/app/views/widget/department_dialog.dart';
import 'package:tfg_app/data/department_provider.dart';
import 'package:tfg_app/data/repository/department_repository_impl.dart';
import 'package:tfg_app/domain/department_repository.dart';

class TileDataDepartmentView extends GetView<DepartmentController> {
  final String title;
  final bool mobile;

  final departmentController = Get.lazyPut(
        () => DepartmentController(
      dataRepository: Get.put<DepartmentRepository>(
        DepartmentRepositoryImpl(
          provider: Get.put<DepartmentProvider>(
            DepartmentProviderImpl(),
          ),
        ),
      ),
    ),
  );

  TileDataDepartmentView({Key? key, required this.title, required this.mobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                    onPressed: () async {
                      departmentDialog(null, 'Create Department').then(
                            (value) {
                          if (value != null) {
                            controller.createDepartment(value);
                            controller.update();
                          }
                        },
                      );
                    }),
                Text(title, style: const TextStyle(fontSize: 20)),
              ],
            ),
            mobile != false ? TextButton(
                onPressed: () => Get.toNamed(Routes.DATA + Routes.DEPARTMENT_LIST),
                child: const Text(
                  'See all',
                  style: TextStyle(color: Colors.green),
                ),) : Container(),
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
