
import 'package:get/get.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:tfg_app/domain/degree_repository.dart';

class DegreeController extends GetxController with StateMixin {

  DegreeController({required this.dataRepository});

  final DegreeRepository dataRepository;

  @override
  void onInit() {
    super.onInit();
    getDegrees();
  }

  void createDegree(DegreeModel degree) {
    dataRepository.createDegree(degree).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void getDegrees() {
    dataRepository.getDegrees().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateDegree(DegreeModel degree) {
    dataRepository.updateDegree(degree).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  void deleteDegree(int id) {
    dataRepository.deleteDegree(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}

