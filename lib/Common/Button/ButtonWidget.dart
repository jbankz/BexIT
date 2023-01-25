import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bexit/Common/TextView/Models/TextViewConfig.dart';
import '../../Assets/AppColors.dart';
import '../Gap.dart';
import '../Image/ImageView.dart';
import '../Image/Model/ImageConfig.dart';
import '../TextView/TextView.dart';
import 'Model/ButtonConfig.dart';

class ButtonWidget extends StatelessWidget {
  final ButtonConfig config;
  const ButtonWidget({required this.config, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: config.width?.w ?? double.infinity,
        height: config.height?.h,
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(config.elevation),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: MaterialStateProperty.all(
                    config.buttonType == ButtonType.fill
                        ? config.enabled
                            ? config.buttonColor
                            : AppColors.primaryDim
                        : AppColors.scaffold),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(config.radius!.r),
                        side: BorderSide(
                            color: config.enabled
                                ? config.buttonOutlinedColor!
                                : AppColors.primaryDim)))),
            onPressed: config.enabled
                ? (config.loading ? null : config.onPressed)
                : null,
            child: config.icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageView(
                          imageConfig: ImageConfig(
                              imageURL: config.icon!,
                              imageType: ImageType.svg)),
                      const Gap(width: 12),
                      Flexible(
                          child: TextView(
                        config: TextViewConfig(
                            text: config.text,
                            color: config.buttonType == ButtonType.fill
                                ? config.textColor
                                : AppColors.primary,
                            fontWeight: FontWeight.w400,
                            fontSize: config.fontSize!),
                      )),
                    ],
                  )
                : TextView(
                    config: TextViewConfig(
                        text: config.text,
                        color: config.buttonType == ButtonType.fill
                            ? config.textColor
                            : AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: config.fontSize!),
                  )));
  }
}

class CustomrCircleAdd extends StatelessWidget {
  const CustomrCircleAdd({super.key, required this.tap});

  final Function() tap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 50.h,
          width: 50.w,
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 19.h),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary)),
          child: ImageView(
              imageConfig: ImageConfig(imageURL: '', imageType: ImageType.svg)),
        ),
      ),
    );
  }
}

class AltMenuBtnWidget extends StatelessWidget {
  const AltMenuBtnWidget({Key? key, this.onPressed, this.text = 'Not now'})
      : super(key: key);

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: onPressed,
        child: TextView(
            config: TextViewConfig(
                text: text,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
                textAlign: TextAlign.center)));
  }
}
