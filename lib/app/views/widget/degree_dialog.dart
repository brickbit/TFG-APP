
import 'package:flutter/material.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:uuid/uuid.dart';
import 'build_text_field.dart';
import 'custom_dropdown.dart';
import 'package:get/get.dart';

Future<DegreeModel?> degreeDialog(DegreeModel? degree, String title ) {
  final _nameController = TextEditingController();
  final _yearController = TextEditingController();
  var id = degree?.id;
  int _numSemesters = degree?.num_semesters ?? 8;
  var _controller = Get.put(DropdownController(selected: (degree?.num_semesters ?? 8).toString().obs));

  return Get.defaultDialog(
    title: title,
    content: SizedBox(
      height: 265,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField(
                'Name of degree', degree?.name ?? "", _nameController),
            const SizedBox(height: 16),
            buildTextField(
                'Year of degree', degree?.year ?? "", _yearController),
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              width: Size.infinite.width,
              child: DropdownPickerGetX(
                menuOptions: const ['4', '8'],
                selectedOption: _numSemesters.toString(),
                controller: _controller,
              ),
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
          var degree = DegreeModel(
              id: id ?? uuid.v4().hashCode,
              name: _nameController.text,
              num_semesters: int.parse(_controller.selected.value),
              year: _yearController.text);
          Get.back(result: degree);
        },
        child: const Text(
          'OK',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}