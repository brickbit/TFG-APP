import 'package:get/get.dart';
import 'package:tfg_app/data/model/data_model.dart';
import 'package:tfg_app/data/model/subject_model.dart';
import 'package:tfg_app/domain/data_repository.dart';

class ScheduleController extends GetxController with StateMixin<DataModel> {
  final DataRepository dataRepository;
  var subjects = Rx<List<SubjectModel>>([]);
  var morning5Rows = List.generate(
          12, (i) => List<SubjectModel?>.filled(5, null, growable: false),
          growable: false)
      .obs;
  var afternoon5Rows = List.generate(
          12, (i) => List<SubjectModel?>.filled(5, null, growable: false),
          growable: false)
      .obs;
  var morning15Rows = List.generate(
          12, (i) => List.filled(15, null, growable: false),
          growable: false)
      .obs;
  var afternoon15Rows = List.generate(
          12, (i) => List.filled(15, null, growable: false),
          growable: false)
      .obs;

  ScheduleController({required this.dataRepository});

  @override
  void onInit() {
    getData();
    super.onInit();
    print(morning5Rows);
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

  void restoreItem(int row, int column) {
    SubjectModel? item = subjects.value.firstWhereOrNull(
        (element) => element.id == morning5Rows.value[column][row]?.id);
    item ??= morning5Rows.value[column][row];
    var pos = subjects.value.indexOf(item!);
    var newItem = item.deleteItem(newTime: item.time + 30);
    subjects.value[pos] = newItem;
    morning5Rows.value[column][row] = null;
    update();
  }
}
