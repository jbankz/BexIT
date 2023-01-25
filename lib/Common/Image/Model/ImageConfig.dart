import 'dart:io';

import 'package:flutter/material.dart';

enum ImageType { asset, network, file, svg }

class ImageConfig {
  final String imageURL;
  final ImageType imageType;
  final double? height;
  final double? width;
  BoxFit? boxFit;
  final Color? color;
  final Function()? onTap;
  final File? file;

  ImageConfig(
      {required this.imageURL,
      required this.imageType,
      this.height,
      this.width,
      this.boxFit = BoxFit.contain,
      this.color,
      this.onTap,
      this.file});
}
