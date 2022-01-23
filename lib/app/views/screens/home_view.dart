import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:tfg_app/app/views/screens/schedule_view.dart';
import 'data_view.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () => BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: landingPageController.changeTabIndex,
        currentIndex: landingPageController.tabIndex.value,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage_rounded),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Exams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),*/
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: buildBottomNavigationMenu(context, controller),
          body: controller.obx(
            (data) => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                DataView(),
                ScheduleView(),
              ],
            ),
            onLoading: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            onEmpty: Container(
              color: Colors.white,
              child: const Text('There is not data to load'),
            ),
          )),
    );
  }
}
