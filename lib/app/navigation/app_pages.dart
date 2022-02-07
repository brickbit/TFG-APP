import 'package:get/get.dart';
import 'package:tfg_app/app/binding/classroom_binding.dart';
import 'package:tfg_app/app/binding/degree_binding.dart';
import 'package:tfg_app/app/binding/department_binding.dart';
import 'package:tfg_app/app/binding/edit_schedule_binding.dart';
import 'package:tfg_app/app/binding/home_binding.dart';
import 'package:tfg_app/app/binding/login_binding.dart';
import 'package:tfg_app/app/binding/recover_password_binding.dart';
import 'package:tfg_app/app/binding/schedule_binding.dart';
import 'package:tfg_app/app/binding/splash_binding.dart';
import 'package:tfg_app/app/binding/subject_binding.dart';
import 'package:tfg_app/app/views/screens/classroom_list_view.dart';
import 'package:tfg_app/app/views/screens/degree_list_view.dart';
import 'package:tfg_app/app/views/screens/department_list_view.dart';
import 'package:tfg_app/app/views/screens/edit_schedule_view.dart';
import 'package:tfg_app/app/views/screens/home_view.dart';
import 'package:tfg_app/app/views/screens/login_view.dart';
import 'package:tfg_app/app/views/screens/recover_password_view.dart';
import 'package:tfg_app/app/views/screens/schedule_view.dart';
import 'package:tfg_app/app/views/screens/splash_view.dart';
import 'package:tfg_app/app/views/screens/subject_list_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.recoverPassword,
      page: () => RecoverPasswordView(),
      binding: RecoverPasswordBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.degreeList,
      page: () => const DegreeListView(),
      binding: DegreeBinding(),
    ),
    GetPage(
      name: Routes.classroomList,
      page: () => const ClassroomListView(),
      binding: ClassroomBinding(),
    ),
    GetPage(
      name: Routes.departmentList,
      page: () => const DepartmentListView(),
      binding: DepartmentBinding(),
    ),
    GetPage(
      name: Routes.subjectList,
      page: () => const SubjectListView(),
      binding: SubjectBinding(),
    ),
    GetPage(
      name: Routes.schedule,
      page: () => ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: Routes.editSchedule,
      page: () => EditScheduleView(),
      binding: EditScheduleBinding(),
    ),
  ];
}
