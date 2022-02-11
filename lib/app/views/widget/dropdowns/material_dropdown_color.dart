
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget materialDropdownColor(RxString selected, List<String> items) {
  return Obx(
        () => DropdownButton<String>(
      value: selected.value,
      style: const TextStyle(color: Colors.green, fontSize: 16.0),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      isExpanded: true,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value),
              SizedBox(
                height: 20,
                width: 20,
                child: Container(color: getColor(value)),
              )
            ],
          ),
        );
      }).toList(),
      onChanged: (String? updatedValue) {
        selected.value = updatedValue!;
      },
    ),
  );
}

MaterialColor getColor(value) {
  if (value == 'blue'.tr) {
    return Colors.blue;
  } else if (value == 'red'.tr) {
    return Colors.red;
  } else if (value == 'yellow'.tr) {
    return Colors.yellow;
  } else if (value == 'orange'.tr) {
    return Colors.orange;
  } else if (value == 'green'.tr) {
    return Colors.green;
  } else {
    return Colors.blue;
  }
}
