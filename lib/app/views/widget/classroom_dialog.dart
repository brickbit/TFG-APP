

import 'package:flutter/material.dart';
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:uuid/uuid.dart';
import 'build_text_field.dart';
import 'package:get/get.dart';

import 'material_dropdown.dart';

Future<ClassroomModel?> classroomDialog(ClassroomModel? classroom, String title ) {
  final _nameController = TextEditingController();
  final _acronymController = TextEditingController();
  var id = classroom?.id;
  var _pavilion = (classroom?.pavilion ?? 'TELECOMMUNICATION').obs;

  return Get.defaultDialog(
    title: title,
    content: SizedBox(
      height: 265,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField(
                'Name of classroom', classroom?.name ?? "", _nameController),
            const SizedBox(height: 16),
            buildTextField(
                'Acronym of classroom', classroom?.acronym ?? "", _acronymController),
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              width: Size.infinite.width,
              child: materialDropdown(_pavilion, [
                  'TELECOMMUNICATION', 'COMPUTING', 'ARCHITECTURE', 'CIVIL_WORK', 'CENTRAL'
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
        child: const Text(
          'Cancel',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      TextButton(
        onPressed: () {
          var uuid = const Uuid();
          var classroom = ClassroomModel(
              id: id ?? uuid.v4().hashCode,
              name: _nameController.text,
              pavilion: _pavilion.value,
              acronym: _acronymController.text);
          Get.back(result: classroom);
        },
        child: const Text(
          'OK',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}