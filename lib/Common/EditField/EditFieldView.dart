import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:bexit/Common/TextView/Models/TextViewConfig.dart';

import '../../Assets/AppColors.dart';
import '../Gap.dart';
import '../TextView/TextView.dart';
import 'Model/EditFieldConfig.dart';

// ignore: must_be_immutable
class EditFormField extends StatelessWidget {
  const EditFormField({Key? key, required this.config}) : super(key: key);

  final EditFieldConfig config;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (config.hint != null)
          Row(
            children: [
              Expanded(
                child: TextView(
                    config: TextViewConfig(
                        text: config.hint ?? '',
                        fontSize: 12,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600)),
              ),
              if (config.hintRight != null) const Spacer(),
              if (config.hintRight != null)
                TextView(
                    config: TextViewConfig(
                        text: config.hintRight ?? '',
                        fontSize: 12,
                        textAlign: TextAlign.right,
                        fontWeight: FontWeight.w500))
            ],
          ),
        if (config.hint != null) const Gap(height: 8),
        TextFormField(
            readOnly: config.readOnly!,
            onTap: config.onTapped,
            key: config.formKey,
            cursorColor: AppColors.primary,
            keyboardType: config.keyboardType,
            enabled: config.enabled,
            focusNode: config.focusNode,
            textInputAction: config.textInputAction,
            textCapitalization: config.textCapitalization!,
            autovalidateMode: config.autoValidateMode,
            onSaved: config.onSaved,
            onChanged: config.onChange,
            maxLines: config.maxLines,
            inputFormatters: config.inputFormatters,
            autocorrect: config.autocorrect!,
            minLines: config.minLines,
            obscureText: config.obscureText!,
            maxLength: config.maxLength,
            validator: config.validator,
            initialValue: config.initialValue,
            controller: config.controller,
            textAlign: config.textAlign,
            style: config.textStyle ??
                TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
            decoration: config.decoration ??
                InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 0)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Colors.red, width: 0),
                    ),
                    labelText: config.label,
                    hintStyle: config.hintStyle,
                    labelStyle: config.labelStyle,
                    filled: config.filled,
                    fillColor: config.filledColor,
                    prefix: config.prefixWidget,
                    prefixIcon: config.prefixIconWidget,
                    hintText: config.label,
                    alignLabelWithHint: config.alignLabelWithHint,
                    contentPadding: config.edgeInsetsGeometry ??
                        EdgeInsets.symmetric(horizontal: 16.w),
                    suffixIcon: config.suffixIconWidget)),
      ],
    );
  }
}
