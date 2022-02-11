

import 'package:flutter/material.dart';
import 'package:tfg_app/app/extension/string_extension.dart';
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:uuid/uuid.dart';
import 'build_text_field.dart';
import 'package:get/get.dart';

import 'material_dropdown.dart';

Future<ClassroomModel?> classroomDialog(ClassroomModel? classroom, String title ) {
  final _nameController = TextEditingController();
  final _acronymController = TextEditingController();
  var id = classroom?.id;
  var _pavilion = (classroom?.pavilion ?? 'telecommunication'.tr).obs;

  return Get.defaultDialog(
    title: title,
    content: SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField(
                'name'.tr, classroom?.name ?? "", _nameController),
            const SizedBox(height: 16),
            buildTextField(
                'acronym'.tr, classroom?.acronym ?? "", _acronymController),
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              width: Size.infinite.width,
              child: materialDropdown(_pavilion, [
                  'telecommunication'.tr, 'computing'.tr, 'architecture'.tr, 'civil_work'.tr, 'central'.tr
                ])
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'cancel'.tr,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      TextButton(
        onPressed: () {
          var uuid = const Uuid();
          var classroom = ClassroomModel(
              id: id ?? uuid.v4().hashCode,
              name: _nameController.text,
              pavilion: _pavilion.value.toClassroom(),
              acronym: _acronymController.text);
          Get.back(result: classroom);
        },
        child:  Text(
          'ok'.tr,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

