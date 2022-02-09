
import 'package:get/get.dart';
import 'package:tfg_app/data/model/department_model.dart';
import 'package:tfg_app/domain/department_repository.dart';

class DepartmentController extends GetxController with StateMixin {

  var departments = Rx<List<DepartmentModel>>([]);

  DepartmentController({required this.dataRepository});

  final DepartmentRepository dataRepository;

  @override
  void onInit() {
    super.onInit();
    getDepartments();
  }

  void createDepartment(DepartmentModel department) {
    dataRepository.createDepartment(department).then((data) {
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void getDepartments() {
    dataRepository.getDepartments().then((data) {
      departments.value.clear();
      departments.value.addAll(data);
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateDepartment(DepartmentModel department) {
    dataRepository.updateDepartment(department).then((data) {
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  void deleteDepartment(int id) {
    dataRepository.deleteDepartment(id).then((data) {
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}