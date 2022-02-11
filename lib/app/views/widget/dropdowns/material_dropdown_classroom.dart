
import 'package:flutter/material.dart';
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:get/get.dart';

Widget materialDropdownClassroom(
    Rx<ClassroomModel> selected, List<ClassroomModel> items) {
  return Obx(
        () => DropdownButton<String>(
      value: selected.value.acronym,
      style: const TextStyle(color: Colors.green, fontSize: 16.0),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      isExpanded: true,
      items: items.map((ClassroomModel value) {
        return DropdownMenuItem<String>(
          value: value.acronym,
          child: Text(value.acronym!),
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