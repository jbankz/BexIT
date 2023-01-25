import 'package:flutter/material.dart';

import '../../../Assets/AppColors.dart';

enum ButtonType { fill, outlined }

class ButtonConfig {
  final Function() onPressed;
  final String text;
  final double? height;
  final double? width;
  final bool loading;
  final Color? buttonColor;
  final Color? buttonOutlinedColor;
  final Color? textColor;
  final double? fontSize;
  final ButtonType? buttonType;
  final String? icon;
  final double? radius;
  final double? elevation;
  final bool enabled;

  ButtonConfig(
      {required this.text,
      required this.onPressed,
      this.height = 56,
      this.width,
      this.loading = false,
      this.enabled = true,
      this.buttonType = ButtonType.fill,
      this.buttonColor = AppColors.primary,
      this.buttonOutlinedColor = AppColors.primary,
      this.textColor,
      this.icon,
      this.elevation = .2,
      this.fontSize = 17,
      this.radius = 14});
}
