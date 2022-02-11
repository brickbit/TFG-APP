
import 'package:get/get.dart';
import 'package:tfg_app/data/model/subject_model.dart';
import 'package:tfg_app/domain/repository/subject_repository.dart';

class SubjectController extends GetxController with StateMixin {

  SubjectController({required this.dataRepository});

  final SubjectRepository dataRepository;

  @override
  void onInit() {
    super.onInit();
    getSubjects();
  }

  void createSubject(SubjectModel subject) {
    dataRepository.createSubject(subject).then((data) {
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void getSubjects() {
    dataRepository.getSubjects().then((data) {
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateSubject(SubjectModel subject) {
    dataRepository.updateSubject(subject).then((data) {
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  void deleteSubject(int id) {
    dataRepository.deleteSubject(id).then((data) {
      data.sort((a,b) => a.name!.compareTo(b.name!));
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}