import 'package:get/get.dart';
import 'package:tfg_app/app/binding/classroom_binding.dart';
import 'package:tfg_app/app/binding/data_binding.dart';
import 'package:tfg_app/app/binding/degree_binding.dart';
import 'package:tfg_app/app/binding/department_binding.dart';
import 'package:tfg_app/app/binding/home_binding.dart';
import 'package:tfg_app/app/binding/login_binding.dart';
import 'package:tfg_app/app/binding/recover_password_binding.dart';
import 'package:tfg_app/app/binding/schedule_binding.dart';
import 'package:tfg_app/app/binding/splash_binding.dart';
import 'package:tfg_app/app/binding/subject_binding.dart';
import 'package:tfg_app/app/views/screens/classroom_list_view.dart';
import 'package:tfg_app/app/views/screens/data_view.dart';
import 'package:tfg_app/app/views/screens/degree_list_view.dart';
import 'package:tfg_app/app/views/screens/department_list_view.dart';
import 'package:tfg_app/app/views/screens/home_view.dart';
import 'package:tfg_app/app/views/screens/login_view.dart';
import 'package:tfg_app/app/views/screens/recover_password_view.dart';
import 'package:tfg_app/app/views/screens/schedule_view.dart';
import 'package:tfg_app/app/views/screens/splash_view.dart';
import 'package:tfg_app/app/views/screens/subject_list_view.dart';
import 'app_routes.dart';

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
      page: () => DataView(),
      binding: DataBinding(),
      children: [
        GetPage(
          name: Routes.DEGREE_LIST,
          page: () => const DegreeListView(),
          binding: DegreeBinding(),
        ),
        GetPage(
          name: Routes.CLASSROOM_LIST,
          page: () => const ClassroomListView(),
          binding: ClassroomBinding(),
        ),
        GetPage(
          name: Routes.DEPARTMENT_LIST,
          page: () => const DepartmentListView(),
          binding: DepartmentBinding(),
        ),
        GetPage(
          name: Routes.SUBJECT_LIST,
          page: () => SubjectListView(),
          binding: SubjectBinding(),
        ),
      ]
    ),
    GetPage(
      name: Routes.SCHEDULE,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
    ),
  ];
}
