import 'package:bexit/Common/TextView/Models/TextViewConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

import '../Assets/AppColors.dart';
import '../Common/TextView/TextView.dart';

class MessageNotification extends StatefulWidget {
  final String message;
  final bool error;

  const MessageNotification(
      {Key? key, required this.message, this.error = false})
      : super(key: key);

  @override
  State<MessageNotification> createState() => _MessageNotificationState();
}

class _MessageNotificationState extends State<MessageNotification>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
        parent: controller, curve: Curves.easeInOut, reverseCurve: Curves.ease);
    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: GestureDetector(
        onTap: () => OverlaySupportEntry.of(context)!.dismiss(),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: kToolbarHeight, left: 16.w, right: 16.w),
          child: Material(
              color: widget.error ? Colors.red : AppColors.primary,
              borderRadius: BorderRadius.circular(12.r),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextView(
                    config: TextViewConfig(
                        text: widget.message,
                        textAlign: TextAlign.left,
                        color: AppColors.scaffold100),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
