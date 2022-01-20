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
            return _dataViewLarge();
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
            TileDataDegreeView(title: 'Degree', mobile: true,),
            TileDataClassroomView(title: 'Classroom', mobile: true,),
            TileDataDepartmentView(title: 'Department', mobile: true,),
            TileDataSubjectView(
              title: 'Subject', mobile: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _dataViewLarge() {
    var index = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill data'),
      ),
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: 300,
              child: ListView(
                children: [
                  TileDataDegreeView(title: 'Degree', mobile: false,),
                  TileDataClassroomView(title: 'Classroom', mobile: false,),
                  TileDataDepartmentView(title: 'Department', mobile: false,),
                  TileDataSubjectView(
                    title: 'Subject', mobile: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                height: Size.infinite.height,
                width: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
            _getListData(index),
          ],
        ),
      ),
    );
  }

  Widget _getListData(int? index) {
    switch (index) {
      case 0:
        return Expanded(child: ListView(children: []));
      case 1:
        return Expanded(child: ListView(children: []));
      case 2:
        return Expanded(child: ListView(children: []));
      case 3:
        return Expanded(child: ListView(children: []));
      default:
        return Container(
          color: Colors.white54,
        );
    }
  }
}
