
import 'package:flutter/material.dart';

Widget buildTextField(String title, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: title,
          )),
    ],
  );
}