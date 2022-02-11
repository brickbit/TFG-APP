import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:tfg_app/app/views/widget/dialog/degree_dialog.dart';
import 'package:tfg_app/app/views/widget/tiles/degree_tile.dart';
import 'package:get/get.dart';

class DegreeListView extends GetView<HomeController> {
  const DegreeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: Text('degree'.tr),
              ),
              body: SafeArea(
                child: _listDegree(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('degree'.tr),
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

  Widget _listDegree() {
    return controller.obx((data) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  degreeTile(
                      MediaQuery.of(context).size.width < 600, data?.degrees ?? [], index),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          degreeDialog(data?.degrees[index], 'editDegree'.tr).then(
                                (value) {
                              if (value != null) {
                                controller.updateDegree(value);
                                controller.update();
                              }
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          controller.deleteDegree(data?.degrees[index].id ?? -1);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            );
          },
          itemCount: data?.degrees.length ?? 0);
    });
  }
}
