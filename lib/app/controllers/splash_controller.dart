import 'dart:async';
import 'package:get/get.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(milliseconds: 2000), () {
      Get.toNamed(Routes.login);
    });
  }
}
