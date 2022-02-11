import 'package:flutter/material.dart';

Widget buildTextField(String hint, String title, TextEditingController controller) {
  controller.text = title;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
        ),
      ),
    ],
  );
}
