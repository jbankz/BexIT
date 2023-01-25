import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../Widgets/MessageNotificationWidget.dart';

class AppUiComponents {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height.h;

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width.w;

  static void triggerNotification(String message, {bool error = false}) {
    showOverlayNotification((context) {
      return MessageNotification(message: message, error: error);
    }, duration: const Duration(milliseconds: 3000));
  }
}
