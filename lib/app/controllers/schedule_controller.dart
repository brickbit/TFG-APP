
import 'package:get/get.dart';
import 'package:tfg_app/app/views/widget/subject_box.dart';
import 'package:tfg_app/data/model/data_model.dart';
import 'package:tfg_app/data/model/subject_model.dart';
import 'package:tfg_app/domain/data_repository.dart';

class ScheduleController extends GetxController with StateMixin<DataModel> {

  final DataRepository dataRepository;
  var subjects = Rx<List<SubjectModel>>([]);
  var dragSubject = Rx<SubjectBox?>(null);

  ScheduleController({required this.dataRepository});

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() {
    change(null, status: RxStatus.loading());
    dataRepository.getData().then((data) {
      subjects.value.clear();
      subjects.value.addAll(data.subjects);
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}