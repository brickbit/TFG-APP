
import 'package:flutter/foundation.dart';

class Logger {
  static void write(String text, {bool isError = false}) {
    if (kDebugMode) {
      print('LOG: $text [$isError]');
    }
  }
}