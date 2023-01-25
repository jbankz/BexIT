import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'Model/ImageConfig.dart';

class ImageView extends StatelessWidget {
  final ImageConfig imageConfig;
  const ImageView({required this.imageConfig, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _imageBuilder();

  Widget _imageBuilder() {
    switch (imageConfig.imageType) {
      case ImageType.asset:
        return _assetImageView;
      case ImageType.network:
        break;
      case ImageType.file:
        break;
      case ImageType.svg:
        return _svgImageView;
    }
    return Container();
  }

  Image get _assetImageView => Image.asset(
        imageConfig.imageURL,
        height: imageConfig.height?.h,
        width: imageConfig.width?.w,
        fit: imageConfig.boxFit,
      );

  SvgPicture get _svgImageView => SvgPicture.asset(
        imageConfig.imageURL,
        height: imageConfig.height?.h,
        width: imageConfig.width?.w,
        fit: imageConfig.boxFit!,
      );
}
