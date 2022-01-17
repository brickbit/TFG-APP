
import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/degree_controller.dart';
import 'package:tfg_app/app/model/edit_data_model.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';
import 'package:get/get.dart';

class DataView extends GetView<DegreeController> {

  DataView({Key? key}) : super(key: key);

  final dataList = [
    EditDataModel(
        title: 'Degree',
        onPlusPressed: () =>
            print('add degree')
            /*Provider.of<DegreeManager>(context, listen: false)
                .createNewItem()*/,
        onSeeAllPressed: () =>
            Get.toNamed(Routes.DATA+Routes.DEGREE_LIST)
            /*Provider.of<DegreeManager>(context, listen: false).showList()*/),
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
          child: ListView.separated(
              itemBuilder: (context, index) {
                return _tileDataOption(dataList[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: dataList.length)),
    );
  }

  Widget _tileDataOption(EditDataModel data) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                    onPressed: data.onPlusPressed),
                Text(data.title, style: const TextStyle(fontSize: 20)),
              ],
            ),
            TextButton(
                onPressed: data.onSeeAllPressed,
                child: const Text(
                  'See all',
                  style: TextStyle(color: Colors.green),
                ))
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }

}