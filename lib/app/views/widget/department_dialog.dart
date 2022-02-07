
import 'package:flutter/material.dart';
import 'package:tfg_app/data/model/department_model.dart';
import 'package:uuid/uuid.dart';
import 'build_text_field.dart';
import 'package:get/get.dart';

Future<DepartmentModel?> departmentDialog(DepartmentModel? department, String title ) {
  final _nameController = TextEditingController();
  final _acronymController = TextEditingController();
  var id = department?.id;

  return Get.defaultDialog(
    title: title,
    content: SizedBox(
      height: 265,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField(
                'name'.tr, department?.name ?? "", _nameController),
            const SizedBox(height: 16),
            buildTextField(
                'acronym'.tr, department?.acronym ?? "", _acronymController),
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
          var department = DepartmentModel(
              id: id ?? uuid.v4().hashCode,
              name: _nameController.text,
              acronym: _acronymController.text);
          Get.back(result: department);
        },
        child: Text(
          'ok'.tr,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}