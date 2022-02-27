
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:tfg_app/data/provider/classroom_provider.dart';
import 'package:tfg_app/data/provider/degree_provider.dart';
import 'package:tfg_app/data/provider/department_provider.dart';
import 'package:tfg_app/data/provider/schedule_provider.dart';
import 'package:tfg_app/data/repository/data_repository_impl.dart';
import 'package:tfg_app/data/provider/subject_provider.dart';
import 'package:tfg_app/domain/provider/schedule_provider.dart';
import 'package:tfg_app/domain/repository/data_repository.dart';
import '../../domain/provider/classroom_provider.dart';
import '../../domain/provider/degree_provider.dart';
import '../../domain/provider/department_provider.dart';
import '../../domain/provider/subject_provider.dart';

class ScheduleBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<DegreeProvider>(() => DegreeProviderImpl());
    Get.lazyPut<ClassroomProvider>(() => ClassroomProviderImpl());
    Get.lazyPut<DepartmentProvider>(() => DepartmentProviderImpl());
    Get.lazyPut<SubjectProvider>(() => SubjectProviderImpl());
    Get.lazyPut<ScheduleProvider>(() => ScheduleProviderImpl());

    Get.lazyPut<DataRepository>(
            () => DataRepositoryImpl(departmentProvider: Get.find(), subjectProvider: Get.find(), classroomProvider: Get.find(), degreeProvider: Get.find(), scheduleProvider: Get.find()));
    Get.put(HomeController(dataRepository: Get.find()));
  }

}