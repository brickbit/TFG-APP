import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/classroom_controller.dart';
import 'package:tfg_app/app/controllers/degree_controller.dart';
import 'package:tfg_app/app/controllers/department_controller.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/views/widget/subject_dialog.dart';
import 'package:tfg_app/data/classroom_provider.dart';
import 'package:tfg_app/data/degree_provider.dart';
import 'package:tfg_app/data/department_provider.dart';
import 'package:tfg_app/data/model/subject_model.dart';
import 'package:tfg_app/data/repository/classroom_repository_impl.dart';
import 'package:tfg_app/data/repository/degree_repository_impl.dart';
import 'package:tfg_app/data/repository/department_repository_impl.dart';
import 'package:tfg_app/domain/classroom_repository.dart';
import 'package:tfg_app/domain/degree_repository.dart';
import 'package:tfg_app/domain/department_repository.dart';

class SubjectListView extends GetView<HomeController> {
  SubjectListView({Key? key}) : super(key: key);
  final DegreeController degreeController = Get.put(
    DegreeController(
      dataRepository: Get.put<DegreeRepository>(
        DegreeRepositoryImpl(
          provider: Get.put<DegreeProvider>(
            DegreeProviderImpl(),
          ),
        ),
      ),
    ),
  );
  final ClassroomController classroomController = Get.put(
    ClassroomController(
      dataRepository: Get.put<ClassroomRepository>(
        ClassroomRepositoryImpl(
          provider: Get.put<ClassroomProvider>(
            ClassroomProviderImpl(),
          ),
        ),
      ),
    ),
  );

  final DepartmentController departmentController = Get.put(
    DepartmentController(
      dataRepository: Get.put<DepartmentRepository>(
        DepartmentRepositoryImpl(
          provider: Get.put<DepartmentProvider>(
            DepartmentProviderImpl(),
          ),
        ),
      ),
    ),
  );

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
                          var degrees = degreeController.degrees.value;
                          var classrooms = classroomController.classrooms.value;
                          var departments = departmentController.departments.value;
                          subjectDialog(data?.subjects[index], 'Edit Subject',degrees, departments,classrooms)
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
                          controller.deleteSubject(data?.subjects[index].id ?? -1);
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
