
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension StringColorToInt on String {
  int getColorNumber() {
    if (this == 'blue'.tr) {
      return 0;
    } else if (this == 'red'.tr) {
      return 1;
    } else if (this == 'yellow'.tr) {
      return 2;
    } else if (this == 'orange'.tr) {
      return 3;
    } else if (this == 'green'.tr) {
      return 4;
    } else {
      return 0;
    }
  }
}

extension ColorToMaterial on int {
  MaterialColor parseColor() {
    switch (this) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.red;
      case 2:
        return Colors.amber;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
