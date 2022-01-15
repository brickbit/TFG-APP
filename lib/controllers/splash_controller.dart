
import 'dart:async';
import 'package:get/get.dart';
import 'package:tfg_app/data/cases_model.dart';
import 'package:tfg_app/navigation/app_routes.dart';

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