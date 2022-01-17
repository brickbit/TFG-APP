
import 'package:get/get.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:tfg_app/domain/data_repository.dart';

class DegreeController extends GetxController with StateMixin {

  DegreeController({required this.dataRepository});

  final DataRepository dataRepository;

  @override
  void onInit() {
    super.onInit();
    getDegrees();
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
}

