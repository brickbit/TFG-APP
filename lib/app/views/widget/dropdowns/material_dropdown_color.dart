
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
  switch (value) {
    case 'Azul':
      return Colors.blue;
    case 'Rojo':
      return Colors.red;
    case 'Naranja':
      return Colors.orange;
    case 'Verde':
      return Colors.green;
    case 'Amarillo':
      return Colors.yellow;
    default:
      return Colors.blue;
  }
}
