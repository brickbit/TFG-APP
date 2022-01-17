import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/classroom_controller.dart';
import 'package:tfg_app/app/views/widget/classroom_dialog.dart';
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:get/get.dart';

class ClassroomListView extends GetView<ClassroomController> {
  const ClassroomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Classrooms'),
              ),
              body: SafeArea(
                child: _listClassroom(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Classrooms'),
              ),
              body: SafeArea(
                child: Column(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _listClassroom() {
    return controller.obx((listClassroom) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _showContent(MediaQuery.of(context).size.width < 600,
                      listClassroom, index),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          classroomDialog(listClassroom[index], 'Edit Classroom')
                              .then(
                            (value) {
                              if (value != null) {
                                controller.updateClassroom(value);
                                controller.update();
                              }
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          controller.deleteClassroom(listClassroom[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            );
          },
          itemCount: listClassroom.length);
    });
  }

  Widget _showContent(bool mobile, List<ClassroomModel> degrees, int index) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobile) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${degrees[index].name!} - ${degrees[index].acronym!}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Pavilion: ${degrees[index].pavilion}',
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${degrees[index].name!} - ${degrees[index].acronym!}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Pavilion: ${degrees[index].pavilion}',
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          );
        }
      },
    );
  }
}
