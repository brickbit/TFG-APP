
import 'package:flutter/material.dart';
import 'package:tfg_app/data/model/department_model.dart';
import 'package:get/get.dart';

Widget materialDropdownDepartment(
    Rx<DepartmentModel> selected, List<DepartmentModel> items) {
  return Obx(
        () => DropdownButton<String>(
      value: selected.value.name,
      style: const TextStyle(color: Colors.green, fontSize: 16.0),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      isExpanded: true,
      items: items.map((DepartmentModel value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name!),
        );
      }).toList(),
      onChanged: (String? updatedValue) {
        var result =
        items.firstWhere((element) => element.acronym == updatedValue!);
        selected.value = result;
      },
    ),
  );
}