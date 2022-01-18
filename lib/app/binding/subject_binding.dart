import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/subject_controller.dart';
import 'package:tfg_app/data/repository/subject_repository_impl.dart';
import 'package:tfg_app/data/subject_provider.dart';
import 'package:tfg_app/domain/subject_repository.dart';

class SubjectBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SubjectProvider>(() => SubjectProviderImpl());
    Get.lazyPut<SubjectRepository>(() => SubjectRepositoryImpl(provider: Get.find()));
    Get.lazyPut(() => SubjectController(dataRepository:  Get.find(),));
  }

}