
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/schedule_controller.dart';

class ScheduleBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ScheduleController());
  }

}