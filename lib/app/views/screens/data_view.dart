
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/data_controller.dart';
import 'package:tfg_app/app/views/screens/tile_data_classroom_view.dart';
import 'package:tfg_app/app/views/screens/tile_data_degree_view.dart';
import 'package:tfg_app/app/views/screens/tile_data_department_view.dart';
import 'package:tfg_app/app/views/screens/tile_data_subject.dart';

class DataView extends GetView<DataController> {

  DataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _dataViewSmall();
          } else {
            return _dataViewSmall();
          }
        },
      ),
    );
  }

  Widget _dataViewSmall() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill data'),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          TileDataDegreeView(title: 'Degree'),
          TileDataClassroomView(title: 'Classroom'),
          TileDataDepartmentView(title: 'Department'),
          TileDataSubjectView(title: 'Subject',)
      ],),),
    );
  }
}