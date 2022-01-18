import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownPickerGetX extends StatelessWidget {
  const DropdownPickerGetX(
      {Key? key,
      required this.menuOptions,
      required this.selectedOption,
      required this.controller})
      : super(key: key);

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

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<String> values;
  final Function(String?) onValueChanged;
  final String result = '';

  const CustomDropdown(
      {Key? key,
      required this.title,
      required this.values,
      required this.onValueChanged})
      : super(key: key);
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.values[0];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedValue = widget.values[0];
  }

  @override
  Widget build(BuildContext context) {
    return
        SizedBox(
          height: 45,
          child: DropdownButton<String>(
            value: selectedValue,
            style: const TextStyle(color: Colors.green, fontSize: 16.0),
            underline: Container(
              height: 2,
              color: Colors.green,
            ),
            isExpanded: true,
            items: widget.values.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? updatedValue) {
              setState(() {
                selectedValue = updatedValue!;
              });
            },
          ),
        );
  }
}
