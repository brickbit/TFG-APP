
import 'package:flutter/material.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:get/get.dart';
import 'material_dropdown.dart';
import 'material_dropdown_degree.dart';

Future<DegreeModel?> scheduleDialog(String title, List<DegreeModel> degrees ) {
  var _degree = (degrees[0]).obs;
  var _semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
  var _semester = '1'.obs;
  var _scheduleTypes = [
    'One subject per hour',
    'Several subject per hour'
  ];
  var _scheduleType = 'One subject per hour'.obs;

  return Get.defaultDialog(
    title: title,
    content: SizedBox(
      height: 265,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
                height: 50,
                width: Size.infinite.width,
                child: materialDropdownDegree(_degree, degrees)
            ),
            const SizedBox(height: 24),
            SizedBox(
                height: 50,
                width: Size.infinite.width,
                child: materialDropdown(_semester, _semesters)
            ),
            const SizedBox(height: 24),
            SizedBox(
                height: 50,
                width: Size.infinite.width,
                child: materialDropdown(_scheduleType, _scheduleTypes)
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
          Get.back();
          Get.toNamed(Routes.EDIT_SCHEDULE);
        },
        child: const Text(
          'OK',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}