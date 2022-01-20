import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/degree_controller.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';
import 'package:tfg_app/app/views/widget/degree_dialog.dart';
import 'package:tfg_app/data/degree_provider.dart';
import 'package:tfg_app/data/repository/degree_repository_impl.dart';
import 'package:tfg_app/domain/degree_repository.dart';

class TileDataDegreeView extends GetView<DegreeController> {
  final String title;
  final bool mobile;
  final degreeController = Get.lazyPut(
    () => DegreeController(
      dataRepository: Get.put<DegreeRepository>(
        DegreeRepositoryImpl(
          provider: Get.put<DegreeProvider>(
            DegreeProviderImpl(),
          ),
        ),
      ),
    ),
  );

  TileDataDegreeView({Key? key, required this.title, required this.mobile})
      : super(key: key);

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
                      degreeDialog(null, 'Create Degree').then(
                        (value) {
                          if (value != null) {
                            controller.createDegree(value);
                            controller.update();
                          }
                        },
                      );
                    }),
                Text(title, style: const TextStyle(fontSize: 20)),
              ],
            ),
            mobile != false ? TextButton(
              onPressed: () => Get.toNamed(Routes.DATA + Routes.DEGREE_LIST),
              child: const Text(
                'See all',
                style: TextStyle(color: Colors.green),
              ),
            ) : Container(),
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
