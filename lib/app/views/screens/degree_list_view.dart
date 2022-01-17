import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/degree_controller.dart';
import 'package:tfg_app/app/views/widget/degree_dialog.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:get/get.dart';

class DegreeListView extends GetView<DegreeController> {
  const DegreeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Degrees'),
              ),
              body: SafeArea(
                child: _listDegree(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Degrees'),
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
    return controller.obx((listDegree) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _showContent(
                      MediaQuery.of(context).size.width < 600, listDegree, index),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          degreeDialog(listDegree[index], 'Edit Degree').then(
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
                        onPressed: () => print('delete clicked'),
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
          itemCount: listDegree.length);
    });

  }

  Widget _showContent(bool mobile, List<DegreeModel> degrees, int index) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobile) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(degrees[index].name!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Num.semesters: ${degrees[index].num_semesters}',
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('A ${degrees[index].year}',
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    degrees[index].name!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' - Num.semesters: ${degrees[index].num_semesters}',
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Year ${degrees[index].year}',
                  style: const TextStyle(fontSize: 12)),
            ],
          );
        }
      },
    );
  }
}
