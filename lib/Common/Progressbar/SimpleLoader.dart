import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Assets/AppColors.dart';

class SimpleLoader extends StatelessWidget {
  const SimpleLoader({super.key});

  @override
  Widget build(BuildContext context) => Center(
      child: LoadingAnimationWidget.horizontalRotatingDots(
          color: AppColors.primary, size: 50.w));
}
