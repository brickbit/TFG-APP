import 'package:get/get.dart';
import 'package:tfg_app/binding/data_binding.dart';
import 'package:tfg_app/binding/home_binding.dart';
import 'package:tfg_app/binding/login_binding.dart';
import 'package:tfg_app/binding/recover_password_binding.dart';
import 'package:tfg_app/binding/schedule_binding.dart';
import 'package:tfg_app/binding/splash_binding.dart';
import 'package:tfg_app/navigation/app_routes.dart';
import 'package:tfg_app/views/screens/data_view.dart';
import 'package:tfg_app/views/screens/home_view.dart';
import 'package:tfg_app/views/screens/login_view.dart';
import 'package:tfg_app/views/screens/recover_password_view.dart';
import 'package:tfg_app/views/screens/schedule_view.dart';
import 'package:tfg_app/views/screens/splash_view.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginView(),
        binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.RECOVER_PASSWORD,
      page: () => RecoverPasswordView(),
      binding: RecoverPasswordBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DATA,
      page: () => const DataView(),
      binding: DataBinding(),
    ),
    GetPage(
      name: Routes.SCHEDULE,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
    ),
  ];
}
