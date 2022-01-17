
import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/degree_controller.dart';
import 'package:tfg_app/app/model/edit_data_model.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/views/screens/tile_data_classroom_view.dart';
import 'package:tfg_app/app/views/screens/tile_data_degree_view.dart';

class DataView extends GetView<DegreeController> {

  DataView({Key? key}) : super(key: key);

  final dataList = [
    EditDataModel(
        title: 'Classroom',
        onPlusPressed: () =>
            print('add classroom')
            /*Provider.of<ClassroomManager>(context, listen: false)
                .createNewItem()*/,
        onSeeAllPressed: () =>
            print('show classrooms')
            /*Provider.of<ClassroomManager>(context, listen: false).showList()*/),
    EditDataModel(
        title: 'Department',
        onPlusPressed: () =>
            print('add department')
            /*Provider.of<DepartmentManager>(context, listen: false)
                .createNewItem()*/,
        onSeeAllPressed: () =>
            print('show departments')
            /*Provider.of<DepartmentManager>(context, listen: false)
                .showList()*/),
    EditDataModel(
        title: 'Subject',
        onPlusPressed: () =>
            print('add subject')
            /*Provider.of<SubjectManager>(context, listen: false)
                .createNewItem()*/,
        onSeeAllPressed: () =>
            print('show subjects')
            /*Provider.of<SubjectManager>(context, listen: false).showList()*/)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _dataViewSmall(dataList);
          } else {
            return _dataViewSmall(dataList);
          }
        },
      ),
    );
  }

  Widget _dataViewSmall(List<EditDataModel> dataList) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill data'),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          TileDataDegreeView(title: 'Degree'),
          TileDataClassroomView(title: 'Classroom'),
      ],),),
    );
  }
}