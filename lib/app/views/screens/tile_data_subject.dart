
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/subject_controller.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';
import 'package:tfg_app/app/views/widget/subject_dialog.dart';
import 'package:tfg_app/data/repository/subject_repository_impl.dart';
import 'package:tfg_app/data/subject_provider.dart';
import 'package:tfg_app/domain/subject_repository.dart';

class TileDataSubjectView extends GetView<SubjectController> {
  final String title;

  final subjectController = Get.lazyPut(
        () => SubjectController(
      dataRepository: Get.put<SubjectRepository>(
        SubjectRepositoryImpl(
          provider: Get.put<SubjectProvider>(
            SubjectProviderImpl(),
          ),
        ),
      ),
    ),
  );

  TileDataSubjectView({Key? key, required this.title}) : super(key: key);

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
                      subjectDialog(null, 'Create Subject').then(
                            (value) {
                          if (value != null) {
                            controller.createSubject(value);
                            controller.update();
                          }
                        },
                      );
                    }),
                Text(title, style: const TextStyle(fontSize: 20)),
              ],
            ),
            TextButton(
                onPressed: () => Get.toNamed(Routes.DATA + Routes.SUBJECT_LIST),
                child: const Text(
                  'See all',
                  style: TextStyle(color: Colors.green),
                ))
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
