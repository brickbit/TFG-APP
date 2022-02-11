import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';
import 'package:tfg_app/app/views/widget/classroom_dialog.dart';
import 'package:tfg_app/app/views/widget/classroom_tile.dart';
import 'package:tfg_app/app/views/widget/degree_dialog.dart';
import 'package:tfg_app/app/views/widget/degree_tile.dart';
import 'package:tfg_app/app/views/widget/department_dialog.dart';
import 'package:tfg_app/app/views/widget/department_tile.dart';
import 'package:tfg_app/app/views/widget/subject_dialog.dart';
import 'package:tfg_app/app/views/widget/subject_tile.dart';

class DataView extends GetView<HomeController> {
  const DataView({Key? key});

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
    var indexObx = 0.obs;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('fillData'.tr),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              _dataTile('degree'.tr, 0, indexObx, true),
              _dataTile('classroom'.tr, 1, indexObx, true),
              _dataTile('department'.tr, 2, indexObx, true),
              _dataTile('subject'.tr, 3, indexObx, true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dataViewLarge() {
    var indexObx = 0.obs;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('fillData'.tr),
        ),
        body: SafeArea(
          child: Row(
            children: [
              SizedBox(
                width: 300,
                child: ListView(
                  children: [
                    _dataTile('degree'.tr, 0, indexObx, false),
                    _dataTile('classroom'.tr, 1, indexObx, false),
                    _dataTile('department'.tr, 2, indexObx, false),
                    _dataTile('subject'.tr, 3, indexObx, false)
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
              _getListData(indexObx.value),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showDegreeDialog() async {
    degreeDialog(null, 'createDegree'.tr).then(
      (value) {
        if (value != null) {
          controller.createDegree(value);
          controller.getData();
          controller.update();
        }
      },
    );
  }

  Future<void> showClassroomDialog() async {
    classroomDialog(null, 'createClassroom'.tr).then(
      (value) {
        if (value != null) {
          controller.createClassroom(value);
          controller.getData();
          controller.update();
        }
      },
    );
  }

  Future<void> showDepartmentDialog() async {
    departmentDialog(null, 'createDepartment'.tr).then(
      (value) {
        if (value != null) {
          controller.createDepartment(value);
          controller.getData();
          controller.update();
        }
      },
    );
  }

  Future<void> showSubjectDialog() async {
    subjectDialog(null, 'createSubject'.tr, controller).then(
      (value) {
        if (value != null) {
          controller.createSubject(value);
          controller.getData();
          controller.update();
        }
      },
    );
  }

  Widget _dataTile(String title, int index, Rx<int> indexObx, mobile) {
    var selectedIndex = 3.obs;
    return ListTile(
      leading: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.green,
          ),
          onPressed: () {
            switch (index) {
              case 0:
                showDegreeDialog();
                break;
              case 1:
                showClassroomDialog();
                break;
              case 2:
                showDepartmentDialog();
                break;
              case 3:
                showSubjectDialog();
                break;
              default:
                showDegreeDialog();
            }
          }),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      trailing: mobile != false
          ? TextButton(
              onPressed: () {
                switch (index) {
                  case 0:
                    Get.toNamed(Routes.degreeList);
                    break;
                  case 1:
                    Get.toNamed(Routes.classroomList);
                    break;
                  case 2:
                    Get.toNamed(Routes.departmentList);
                    break;
                  case 3:
                    Get.toNamed(Routes.subjectList);
                    break;
                  default:
                    Get.toNamed(Routes.degreeList);
                }
              },
              child: Text(
                'seeAll'.tr,
                style: const TextStyle(color: Colors.green),
              ),
            )
          : null,
      selectedColor: selectedIndex.value == index ? Colors.grey : null,
      onTap: () {
        indexObx.value = index;
        controller.update();
        selectedIndex.value = index;
      },
    );
  }

  Widget _getListData(int index) {
    switch (index) {
      case 0:
        return Expanded(child: _listDegree());
      case 1:
        return Expanded(child: _listClassroom());
      case 2:
        return Expanded(child: _listDepartment());
      case 3:
        return Expanded(child: _listSubject());
      default:
        return Container(
          color: Colors.white54,
        );
    }
  }

  Widget _listDegree() {
    return controller.obx(
      (data) => ListView.separated(
          scrollDirection: Axis.vertical,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  degreeTile(MediaQuery.of(context).size.width < 600,
                    data?.degrees ?? [], index),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          degreeDialog(data?.degrees[index], 'editDegree'.tr)
                              .then(
                                (value) {
                              if (value != null) {
                                controller.updateDegree(value);
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
                          controller.deleteDegree(data?.degrees[index].id ?? 0);
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
          itemCount: data?.degrees.length ?? 0),
      onLoading: Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      onEmpty: Container(
        color: Colors.white,
        child: Text('noDataLoaded'.tr),
      ),
    );
  }

  Widget _listClassroom() {
    return controller.obx((data) {
      return ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  classroomTile(MediaQuery.of(context).size.width < 600,
                      data?.classrooms ?? [], index),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          classroomDialog(
                                  data?.classrooms[index], 'editClassroom'.tr)
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
                          controller
                              .deleteClassroom(data?.classrooms[index].id ?? 0);
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
          itemCount: data?.classrooms.length ?? 0);
    });
  }

  Widget _listDepartment() {
    return controller.obx((data) {
      return ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  departmentTile(MediaQuery.of(context).size.width < 600,
                      data?.departments ?? [], index),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          departmentDialog(
                                  data?.departments[index], 'editDepartment'.tr)
                              .then(
                            (value) {
                              if (value != null) {
                                controller.updateDepartment(value);
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
                          controller.deleteDepartment(
                              data?.departments[index].id ?? 0);
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
          itemCount: data?.departments.length ?? 0);
    });
  }

  Widget _listSubject() {
    return controller.obx((data) {
      return ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  subjectTile(MediaQuery.of(context).size.width < 600,
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
                              .deleteSubject(data?.subjects[index].id ?? 0);
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
}
