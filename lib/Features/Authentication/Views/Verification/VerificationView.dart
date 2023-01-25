import 'package:bexit/Common/CommonExports.dart';
import 'package:bexit/Features/Authentication/Domain/Entity/AuthEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../Assets/AppColors.dart';
import '../../../../Core/Utils/FieldValidator.dart';
import 'VerificationView.form.dart';
import 'Viewmodel/VerificationViewmodel.dart';

@FormView(fields: [FormTextField(name: 'code')])
class VerificationView extends StatelessWidget with $VerificationView {
  VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerificationViewmodel>.reactive(
        viewModelBuilder: () => VerificationViewmodel(),
        onViewModelReady: (viewModel) {
          syncFormWithViewModel(viewModel);
          codeFocusNode.requestFocus();
        },
        builder: (_, viewmodel, __) => BodyWidget(
            config: BodyConfig(
                showAppBar: true,
                automaticallyImplyLeading: true,
                showLeadingWidget: true,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                loading: viewmodel.isBusy,
                body: Form(
                  key: viewmodel.formKey,
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView(
                        children: [
                          TextView(
                              config: TextViewConfig(
                                  text: 'Verification',
                                  textAlign: TextAlign.left,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700)),
                          const Gap(height: 16),
                          TextView(
                              config: TextViewConfig(
                                  text: 'Please verify your Account',
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400)),
                          const Gap(height: 16),
                          EditFormField(
                              config: EditFieldConfig(
                                  hint: 'OTP',
                                  maxLength: 6,
                                  keyboardType: TextInputType.number,
                                  validator: FieldValidator.validateOTP(),
                                  controller: codeController)),
                        ],
                      )),
                      ButtonWidget(
                          config: ButtonConfig(
                              text: 'Verify Code',
                              textColor: AppColors.white,
                              loading: viewmodel.isBusy,
                              onPressed: () {
                                if (viewmodel.formKey.currentState!
                                    .validate()) {
                                  viewmodel.submitForm(
                                      AuthEntity(code: codeController.text));
                                }
                              })),
                    ],
                  ),
                ))));
  }
}
