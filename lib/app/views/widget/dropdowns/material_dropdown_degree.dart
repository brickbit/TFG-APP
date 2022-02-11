
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/data/model/degree_model.dart';

Widget materialDropdownDegree(
    Rx<DegreeModel> selected, List<DegreeModel> items) {
  return Obx(
        () => DropdownButton<String>(
      value: selected.value.name,
      style: const TextStyle(color: Colors.green, fontSize: 16.0),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      isExpanded: true,
      items: items.map((DegreeModel value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name!),
        );
      }).toList(),
      onChanged: (String? updatedValue) {
        var result =
        items.firstWhere((element) => element.name == updatedValue!);
        selected.value = result;
      },
    ),
  );
}