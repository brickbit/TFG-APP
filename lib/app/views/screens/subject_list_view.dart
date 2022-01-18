import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/subject_controller.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/views/widget/subject_dialog.dart';
import 'package:tfg_app/data/model/subject_model.dart';

class SubjectListView extends GetView<SubjectController> {
  const SubjectListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Subjects'),
              ),
              body: SafeArea(
                child: _listSubject(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Subjects'),
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

  Widget _listSubject() {
    return controller.obx((listSubject) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _showContent(MediaQuery.of(context).size.width < 600,
                      listSubject, index),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          subjectDialog(listSubject[index], 'Edit Subject')
                              .then(
                                (value) {
                              if (value != null) {
                                controller.updateSubject(value);
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
                          controller.deleteSubject(listSubject[index].id);
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
          itemCount: listSubject.length);
    });
  }

  Widget _showContent(bool mobile, List<SubjectModel> subjects, int index) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobile) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${subjects[index].name!} - ${subjects[index].acronym!}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  subjects[index].degree.name.toString()
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Department: ${subjects[index].department.acronym}',
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Classroom: ${subjects[index].classroom.acronym}',
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Semester: ${subjects[index].semester + 1}',
                    ),
                    Text(
                        'Language: ${subjects[index].english==false ? 'Español':'English'}'
                    ),
                ],),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Laboratorio: ${subjects[index].laboratory==false ? 'No':'Yes'}'
                    ),
                    Text(
                        'Seminario: ${subjects[index].seminary==false ? 'No':'Yes'}'
                    ),

                ],),

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
                    '${subjects[index].name!} - ${subjects[index].acronym!}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Semester: ${subjects[index].semester}',
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
