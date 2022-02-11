
import 'package:get/get.dart';
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:tfg_app/domain/repository/classroom_repository.dart';

class ClassroomController extends GetxController with StateMixin {

  var classrooms = Rx<List<ClassroomModel>>([]);

  ClassroomController({required this.dataRepository});

  final ClassroomRepository dataRepository;

  @override
  void onInit() {
    super.onInit();
    getClassrooms();
  }

  void createClassroom(ClassroomModel classroom) {
    dataRepository.createClassroom(classroom).then((data) {
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void getClassrooms() {
    dataRepository.getClassrooms().then((data) {
      classrooms.value.clear();
      classrooms.value.addAll(data);
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateClassroom(ClassroomModel classroom) {
    dataRepository.updateClassroom(classroom).then((data) {
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  void deleteClassroom(int id) {
    dataRepository.deleteClassroom(id).then((data) {
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}