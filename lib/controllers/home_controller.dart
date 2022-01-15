
import 'package:get/get.dart';
import 'package:tfg_app/data/cases_model.dart';

class HomeController extends GetxController with StateMixin<CasesModel>{

  HomeController();

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

}