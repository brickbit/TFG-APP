import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:tfg_app/app/extension/color_extension.dart';
import 'package:tfg_app/data/model/subject_model.dart';
import 'package:uuid/uuid.dart';
import 'build_text_field.dart';
import 'package:get/get.dart';
import 'material_dropdown.dart';
import 'material_dropdown_classroom.dart';
import 'material_dropdown_color.dart';
import 'material_dropdown_degree.dart';
import 'material_dropdown_department.dart';

Future<SubjectModel?> subjectDialog(SubjectModel? subject, String title, HomeController controller) {
  final _nameController = TextEditingController();
  final _acronymController = TextEditingController();
  final _groupController = TextEditingController();
  var _isSeminary = (subject?.seminary ?? false).obs;
  var _isLaboratory = (subject?.laboratory ?? false).obs;
  var _isEnglish = (subject?.english ?? false).obs;
  var _time = (subject?.time.toString() ?? '60').obs;
  var _semester = ((subject?.semester ?? 0) + 1).toString().obs;
  var id = subject?.id;

  var _classroomItems = controller.classrooms.value;
  var _classroom = _classroomItems[0].obs;
  var _departmentItems = controller.departments.value;
  var _department = _departmentItems[0].obs;
  var _degreeItems = controller.degrees.value;
  var _degree = _degreeItems[0].obs;
  var _colorItems = ['Azul', 'Verde', 'Rojo','Amarillo','Naranja'];
  var _color = _colorItems[0].obs;

  return Get.defaultDialog(
    title: title,
    content: SizedBox(
      height: 400,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 360,
          width: 280,
          child: ListView(
            children: [
              buildTextField(
                  'Name of subject', subject?.name ?? "", _nameController),
              const SizedBox(height: 16),
              buildTextField('Acronym of subject', subject?.acronym ?? "",
                  _acronymController),
              const SizedBox(height: 24),
              buildTextField('Group of subject', subject?.classGroup ?? "",
                  _groupController),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Seminary'),
                  Obx(
                    () => Switch(
                      value: _isSeminary.value,
                      activeColor: Colors.amber,
                      onChanged: (value) => _isSeminary.value = value,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Laboratory'),
                  Obx(
                        () => Switch(
                    value: _isLaboratory.value,
                    activeColor: Colors.amber,
                    onChanged: (value) => _isLaboratory.value = value,
                  ),),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('English'),
                  Obx(
                        () => Switch(
                    value: _isEnglish.value,
                    activeColor: Colors.amber,
                    onChanged: (value) => _isEnglish.value = value,
                  ),),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Time(minutes)'),
                  materialDropdown(_time, [
                    '60',
                    '90',
                    '120',
                    '150',
                    '180',
                    '210',
                    '240',
                    '270',
                    '300'
                  ]),
                ],
              ),
              const SizedBox(height: 24),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Semester'),
                materialDropdown(
                    _semester, ['1', '2', '3', '4', '5', '6', '7', '8']),
              ]),
              const SizedBox(height: 24),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Classroom'),
                materialDropdownClassroom(_classroom, _classroomItems),
              ]),
              const SizedBox(height: 24),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Department'),
                materialDropdownDepartment(_department, _departmentItems),
              ]),
              const SizedBox(height: 24),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Degree'),
                materialDropdownDegree(_degree, _degreeItems),
              ]),
              const SizedBox(height: 24),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Color'),
                materialDropdownColor(_color, _colorItems),
              ]),
            ],
          ),
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
          var subject = SubjectModel(
            id: id ?? uuid.v4().hashCode,
            name: _nameController.text,
            acronym: _acronymController.text,
            classGroup: _groupController.text,
            seminary: _isSeminary.value,
            laboratory: _isLaboratory.value,
            english: _isEnglish.value,
            time: int.parse(_time.value),
            semester: int.parse(_semester.value),
            days: "",
            hours: "",
            turns: "",
            classroom: _classroom.value,
            department: _department.value,
            degree: _degree.value,
            color: _color.value.getColorNumber(),
          );
          Get.back(result: subject);
        },
        child: const Text(
          'OK',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}










