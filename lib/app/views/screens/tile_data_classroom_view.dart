
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/classroom_controller.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';
import 'package:tfg_app/app/views/widget/classroom_dialog.dart';
import 'package:tfg_app/data/classroom_provider.dart';
import 'package:tfg_app/data/repository/classroom_repository_impl.dart';
import 'package:tfg_app/domain/classroom_repository.dart';

class TileDataClassroomView extends GetView<ClassroomController> {
  final String title;
  final bool mobile;

  final classroomController = Get.lazyPut(
        () => ClassroomController(
      dataRepository: Get.put<ClassroomRepository>(
        ClassroomRepositoryImpl(
          provider: Get.put<ClassroomProvider>(
            ClassroomProviderImpl(),
          ),
        ),
      ),
    ),
  );

  TileDataClassroomView({Key? key, required this.title, required this.mobile}) : super(key: key);

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
                      classroomDialog(null, 'Create Classroom').then(
                            (value) {
                          if (value != null) {
                            controller.createClassroom(value);
                            controller.update();
                          }
                        },
                      );
                    }),
                Text(title, style: const TextStyle(fontSize: 20)),
              ],
            ),
            mobile != false ? TextButton(
                onPressed: () => Get.toNamed(Routes.CLASSROOM_LIST),
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
