
import 'package:flutter/material.dart';

class EditDataModel {
  final String title;
  final VoidCallback onPlusPressed;
  final VoidCallback? onSeeAllPressed;

  EditDataModel({
    required this.title,
    required this.onPlusPressed,
    required this.onSeeAllPressed
  });
}