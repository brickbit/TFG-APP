
import 'package:get/get.dart';
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:tfg_app/domain/classroom_repository.dart';
import 'package:tfg_app/domain/degree_repository.dart';

class ClassroomController extends GetxController with StateMixin {

  ClassroomController({required this.dataRepository});

  final ClassroomRepository dataRepository;

  @override
  void onInit() {
    super.onInit();
    getClassrooms();
  }

  void createClassroom(ClassroomModel classroom) {
    dataRepository.createClassroom(classroom).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void getClassrooms() {
    dataRepository.getClassrooms().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateClassroom(ClassroomModel classroom) {
    dataRepository.updateClassroom(classroom).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  void deleteClassroom(int id) {
    dataRepository.deleteClassroom(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}