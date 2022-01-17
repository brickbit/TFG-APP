
import 'package:get/get.dart';
import 'package:tfg_app/data/model/department_model.dart';
import 'package:tfg_app/domain/department_repository.dart';

class DepartmentController extends GetxController with StateMixin {

  DepartmentController({required this.dataRepository});

  final DepartmentRepository dataRepository;

  @override
  void onInit() {
    super.onInit();
    getDepartments();
  }

  void createDepartment(DepartmentModel department) {
    dataRepository.createDepartment(department).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void getDepartments() {
    dataRepository.getDepartments().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateDepartment(DepartmentModel department) {
    dataRepository.updateDepartment(department).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  void deleteDepartment(int id) {
    dataRepository.deleteDepartment(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}