import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownPickerGetX extends StatelessWidget {
   const DropdownPickerGetX(
      {Key? key, required this.menuOptions,
      required this.selectedOption, required this.controller}) : super(key: key);

  final List<dynamic> menuOptions;
  final String selectedOption;
  final DropdownController controller;

  @override
  Widget build(BuildContext context) {
    var option = selectedOption.obs;
    return Obx(
      () => DropdownButton<String>(
        items: menuOptions
            .map(
              (data) => DropdownMenuItem<String>(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data,
                    ),
                  ],
                ),
                value: data,
              ),
            )
            .toList(),
        value: option.value,
        underline: Container(
          height: 2,
          color: Colors.green,
        ),
        isExpanded: true,
        onChanged: (String? newValue) {
          option.value = newValue!;
          controller.selectItem(newValue);
        },
      ),
    );
  }
}

class DropdownController extends GetxController {
  RxString selected;

  DropdownController({required this.selected});

  void selectItem(String value) => selected.value = value;
}