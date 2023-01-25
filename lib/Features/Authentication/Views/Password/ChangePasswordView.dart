import 'package:bexit/Common/CommonExports.dart';
import 'package:bexit/Core/Utils/FieldValidator.dart';
import 'package:bexit/Features/Authentication/Domain/Entity/AuthEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../Assets/AppColors.dart';
import 'ChangePasswordView.form.dart';
import 'Viewmodel/ChangePasswordViewViewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'currentPassword'),
  FormTextField(name: 'newPassword'),
])
class ChangePasswordView extends StatelessWidget with $ChangePasswordView {
  ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewViewmodel>.reactive(
        viewModelBuilder: () => ChangePasswordViewViewmodel(),
        onViewModelReady: (viewModel) {
          syncFormWithViewModel(viewModel);
          currentPasswordFocusNode.requestFocus();
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
                                  text: 'Update password',
                                  textAlign: TextAlign.left,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700)),
                          const Gap(height: 16),
                          TextView(
                              config: TextViewConfig(
                                  text: 'You can update your password',
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400)),
                          const Gap(height: 23),
                          EditFormField(
                              config: EditFieldConfig(
                                  hint: 'Current password',
                                  focusNode: currentPasswordFocusNode,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: FieldValidator.validatePlainPass(),
                                  obscureText: true,
                                  controller: currentPasswordController)),
                          const Gap(height: 16),
                          EditFormField(
                              config: EditFieldConfig(
                                  hint: 'New password',
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: FieldValidator.validatePlainPass(),
                                  obscureText: true,
                                  controller: newPasswordController)),
                        ],
                      )),
                      ButtonWidget(
                          config: ButtonConfig(
                              text: 'Update password',
                              textColor: AppColors.white,
                              loading: viewmodel.isBusy,
                              onPressed: () {
                                if (viewmodel.formKey.currentState!
                                    .validate()) {
                                  viewmodel.submitForm(AuthEntity(
                                      currentPassword:
                                          currentPasswordController.text,
                                      newPassword: newPasswordController.text));
                                }
                              })),
                    ],
                  ),
                ))));
  }
}
