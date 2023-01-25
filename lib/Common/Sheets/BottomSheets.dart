import 'package:flutter/material.dart';

import '../../Assets/AppColors.dart';

class BottomSheets {
  static Future<T?> showSheet<T>(BuildContext context,
      {required Widget child, bool isDismissible = true}) {
    return showModalBottomSheet<T>(
        isDismissible: isDismissible,
        isScrollControlled: true,
        backgroundColor: AppColors.black,
        enableDrag: true,
        elevation: 100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: (_) {
          return child;
        });
  }
}
