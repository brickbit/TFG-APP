
import 'package:flutter/material.dart';

extension StringColorToInt on String {
  int getColorNumber() {
    switch(this) {
      case 'Rojo': return 0;
      case 'Azul': return 1;
      case 'Amarillo': return 2;
      case 'Verde': return 3;
      case 'Naranja': return 4;
      default: return 0;
    }
  }
}

extension ColorToMaterial on int {
  MaterialColor parseColor() {
    switch (this) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.amber;
      case 3:
        return Colors.green;
      case 4:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
