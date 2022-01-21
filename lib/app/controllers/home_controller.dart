import 'package:get/get.dart';
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:tfg_app/data/model/data_model.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:tfg_app/data/model/department_model.dart';
import 'package:tfg_app/data/model/subject_model.dart';
import 'package:tfg_app/domain/data_repository.dart';

class HomeController extends GetxController with StateMixin<DataModel> {
  final DataRepository dataRepository;
  var degrees = Rx<List<DegreeModel>>([]);
  var classrooms = Rx<List<ClassroomModel>>([]);
  var departments = Rx<List<DepartmentModel>>([]);
  var subjects = Rx<List<SubjectModel>>([]);

  HomeController(
      {required this.dataRepository});

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() {
    change(null, status: RxStatus.loading());
    dataRepository.getData().then((data) {
      degrees.value.clear();
      degrees.value.addAll(data.degrees);
      classrooms.value.clear();
      classrooms.value.addAll(data.classrooms);
      departments.value.clear();
      departments.value.addAll(data.departments);
      subjects.value.clear();
      subjects.value.addAll(data.subjects);
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void createDegree(DegreeModel degree) {
    change(null, status: RxStatus.loading());
    dataRepository.createDegree(degree).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void deleteDegree(int id) {
    change(null, status: RxStatus.loading());
    dataRepository.deleteDegree(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateDegree(DegreeModel degree) {
    change(null, status: RxStatus.loading());
    dataRepository.updateDegree(degree).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void createClassroom(ClassroomModel classroom) {
    change(null, status: RxStatus.loading());
    dataRepository.createClassroom(classroom).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateClassroom(ClassroomModel classroom) {
    change(null, status: RxStatus.loading());
    dataRepository.updateClassroom(classroom).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  void deleteClassroom(int id) {
    change(null, status: RxStatus.loading());
    dataRepository.deleteClassroom(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void createDepartment(DepartmentModel department) {
    change(null, status: RxStatus.loading());
    dataRepository.createDepartment(department).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateDepartment(DepartmentModel department) {
    change(null, status: RxStatus.loading());
    dataRepository.updateDepartment(department).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  void deleteDepartment(int id) {
    change(null, status: RxStatus.loading());
    dataRepository.deleteDepartment(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void createSubject(SubjectModel subject) {
    change(null, status: RxStatus.loading());
    dataRepository.createSubject(subject).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateSubject(SubjectModel subject) {
    change(null, status: RxStatus.loading());
    dataRepository.updateSubject(subject).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  void deleteSubject(int id) {
    change(null, status: RxStatus.loading());
    dataRepository.deleteSubject(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

}
