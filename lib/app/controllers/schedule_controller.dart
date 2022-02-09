import 'package:get/get.dart';
import 'package:tfg_app/app/mappers/subject_model_mapper.dart';
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:tfg_app/data/model/data_model.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:tfg_app/data/model/department_model.dart';
import 'package:tfg_app/data/model/subject_model.dart';
import 'package:tfg_app/domain/data_repository.dart';

class ScheduleController extends GetxController with StateMixin<DataModel> {
  final DataRepository dataRepository;
  var subjects = Rx<List<SubjectModel>>([]);
  Rx<SubjectModel> selectedSubject = SubjectModel(
      id: -1,
      name: "",
      acronym: "",
      classGroup: "",
      seminary: false,
      laboratory: false,
      english: false,
      time: 0,
      semester: 0,
      days: "",
      hours: "",
      turns: "",
      classroom: ClassroomModel(id: -1, name: "", pavilion: "", acronym: ""),
      department: DepartmentModel(id: -1, name: "", acronym: ""),
      degree: DegreeModel(id: -1, name: "", num_semesters: 0, year: ""),
      color: 0).obs;
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

  void restoreItem(int row, int column, bool morning) {
    if (morning) {
      SubjectModel? item = subjects.value.firstWhereOrNull(
          (element) => element.id == morning5Rows.value[column][row]?.id);
      if(item != null) {
        var pos = subjects.value.indexOf(item);
        var newItem = item.deleteItem(newTime: item.time + 30);
        subjects.value[pos] = newItem;
      } else {
        var newSubject = selectedSubject.value.copyWith(newTime: selectedSubject.value.time + 30);
        subjects.value.add(newSubject);
      }
      morning5Rows.value[column][row] = null;
    } else {
      SubjectModel? item = subjects.value.firstWhereOrNull(
          (element) => element.id == afternoon5Rows.value[column][row]?.id);
      if(item != null) {
        var pos = subjects.value.indexOf(item);
        var newItem = item.deleteItem(newTime: item.time + 30);
        subjects.value[pos] = newItem;
      } else {
        var newSubject = selectedSubject.value.copyWith(newTime: selectedSubject.value.time + 30);
        subjects.value.add(newSubject);
      }
      afternoon5Rows.value[column][row] = null;
    }
    update();
  }

  void dragItemSuccessfully(int index) {
    selectedSubject = subjects.value
        .firstWhere((element) =>
            subjects.value
                .map((data) => data.toSubjectBox())
                .toList()[index]
                .subject
                .id ==
            element.id)
        .obs;
    var pos = subjects.value.indexOf(selectedSubject.value);
    if (subjects.value[pos].time == 0) {
      subjects.value.removeAt(pos);
    }
    update();
  }

  void completeDrag(SubjectModel subject, bool morning, int row, int column) {
    morning
        ? assignItemMorning(subject, row, column)
        : assignItemAfternoon(subject, row, column);
  }

  void assignItemMorning(SubjectModel subject, int row, int column) {
    if (morning5Rows.value[column][row] == null) {
      morning5Rows.value[column][row] = subject;
      var pos = subjects.value.indexOf(selectedSubject.value);
      subjects.value[pos] = selectedSubject.value
          .copyWith(newTime: selectedSubject.value.time - 30);
    }
  }

  void assignItemAfternoon(SubjectModel subject, int row, int column) {
    if (afternoon5Rows.value[column][row] == null) {
      afternoon5Rows.value[column][row] = subject;
      var pos = subjects.value.indexOf(selectedSubject.value);
      subjects.value[pos] = selectedSubject.value
          .copyWith(newTime: selectedSubject.value.time - 30);
    }
  }

  void startDrag(int index) {
    selectedSubject.value = subjects.value.firstWhere((element) =>
        subjects.value
            .map((data) => data.toSubjectBox())
            .toList()[index]
            .subject
            .id ==
        element.id);
  }
}
