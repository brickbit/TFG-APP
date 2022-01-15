
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/data_controller.dart';

class DataBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(DataController());
  }

}