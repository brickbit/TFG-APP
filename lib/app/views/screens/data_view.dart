
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tfg_app/app/controllers/data_controller.dart';

class DataView extends GetView<DataController> {

  const DataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.purple,);
  }

}