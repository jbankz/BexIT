import 'package:flutter/services.dart';

class AppHelpers {
  static void copy(String text) async {
    if (text.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: text));
      return;
    } else {
      throw ('Please enter a valid text');
    }
  }
}
