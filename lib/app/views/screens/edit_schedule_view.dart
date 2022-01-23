import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:get/get.dart';

class EditScheduleView extends GetView<HomeController> {
  const EditScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Edit schedule'),
              ),
              body: SafeArea(
                child: Column(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Edit schedule'),
              ),
              body: SafeArea(
                child: Column(),
              ),
            );
          }
        },
      ),
    );
  }
}