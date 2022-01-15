
import 'dart:async';
import 'package:get/get.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';
import 'package:tfg_app/data/model/cases_model.dart';

class SplashController extends GetxController with StateMixin<CasesModel>{

  SplashController();

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(milliseconds: 2000), () {
      Get.toNamed(Routes.LOGIN);
    });
  }
}