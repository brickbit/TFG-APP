
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/schedule_controller.dart';
import 'package:tfg_app/data/classroom_provider.dart';
import 'package:tfg_app/data/degree_provider.dart';
import 'package:tfg_app/data/department_provider.dart';
import 'package:tfg_app/data/repository/data_repository_impl.dart';
import 'package:tfg_app/data/repository/schedule_repository_impl.dart';
import 'package:tfg_app/data/schedule_provider.dart';
import 'package:tfg_app/data/subject_provider.dart';
import 'package:tfg_app/domain/data_repository.dart';
import 'package:tfg_app/domain/schedule_repository.dart';

class EditScheduleBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<DegreeProvider>(() => DegreeProviderImpl());
    Get.lazyPut<ClassroomProvider>(() => ClassroomProviderImpl());
    Get.lazyPut<DepartmentProvider>(() => DepartmentProviderImpl());
    Get.lazyPut<SubjectProvider>(() => SubjectProviderImpl());
    Get.lazyPut<ScheduleProvider>(() => ScheduleProviderImpl());

    Get.lazyPut<DataRepository>(
            () => DataRepositoryImpl(departmentProvider: Get.find(), subjectProvider: Get.find(), classroomProvider: Get.find(), degreeProvider: Get.find()));
    Get.lazyPut<ScheduleRepository>(() => ScheduleRepositoryImpl(provider: Get.find()));
    Get.put(ScheduleController(dataRepository: Get.find(), scheduleRepository: Get.find()));
  }

}