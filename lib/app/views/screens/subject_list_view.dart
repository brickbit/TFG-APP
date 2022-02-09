import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/extension/color_extension.dart';
import 'package:tfg_app/app/views/widget/subject_dialog.dart';
import 'package:tfg_app/data/model/subject_model.dart';

class SubjectListView extends GetView<HomeController> {
  const SubjectListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: Text('subject'.tr),
              ),
              body: SafeArea(
                child: _listSubject(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('subject'.tr),
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
    return controller.obx((data) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _showContent(MediaQuery.of(context).size.width < 600,
                      data?.subjects ?? [], index),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          subjectDialog(data?.subjects[index], 'editSubject'.tr,
                                  controller)
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
                          controller
                              .deleteSubject(data?.subjects[index].id ?? -1);
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
          itemCount: data?.subjects.length ?? 0);
    });
  }

  Widget _showContent(bool mobile, List<SubjectModel> subjects, int index) {
    subjects.sort((a, b) => a.name!.compareTo(b.name!));
    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobile) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Row(
              children: [
                SizedBox(
                  width: 6,
                  height: 140,
                  child: Container(
                    color: subjects[index].color.parseColor(),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${subjects[index].name!} - ${subjects[index].acronym!}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 4,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(width: 230, child: Text(subjects[index].degree.name.toString())),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'departmentAcronym'.trParams({'acronym': subjects[index].department.name!.toLowerCase().toString()}),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'classroomAcronym'.trParams({'acronym': subjects[index].classroom.acronym.toString()}),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'subjectSemester'.trParams({'semester': (subjects[index].semester + 1).toString()})
                        ),
                        const SizedBox(width: 16,),
                        Text(
                            'subjectLanguage'.trParams({'language': subjects[index].english == false ? 'Español' : 'English'}),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'subjectLaboratory'.trParams({'laboratory':subjects[index].laboratory == false ? 'no'.tr : 'yes'.tr}),),
                        const SizedBox(width: 16,),
                        Text(
                            'subjectSeminar'.trParams({'seminary': subjects[index].seminary == false ? 'no'.tr : 'yes'.tr}),),
                      ],
                    ),
                  ],
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
