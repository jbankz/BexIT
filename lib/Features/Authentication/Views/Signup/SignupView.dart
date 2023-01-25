import 'package:bexit/Common/CommonExports.dart';
import 'package:bexit/Core/App/App.router.dart';
import 'package:bexit/Core/Router/PageRouterExports.dart';
import 'package:bexit/Core/Utils/FieldValidator.dart';
import 'package:bexit/Features/Authentication/Domain/Entity/AuthEntity.dart';
import 'package:bexit/Features/Authentication/Views/Signup/Viewmodel/SignupViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../Assets/AppColors.dart';
import 'SignupView.form.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'phone'),
  FormTextField(name: 'password')
])
class SignupView extends StatelessWidget with $SignupView {
  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewmodel>.reactive(
        viewModelBuilder: () => SignupViewmodel(),
        onViewModelReady: (viewModel) {
          syncFormWithViewModel(viewModel);
          firstNameFocusNode.requestFocus();
        },
        builder: (_, viewmodel, __) => BodyWidget(
            config: BodyConfig(
                showAppBar: false,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                loading: viewmodel.isBusy,
                body: Form(
                  key: viewmodel.formKey,
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView(
                        children: [
                          const Gap(height: 40),
                          TextView(
                              config: TextViewConfig(
                                  text: 'Welcome',
                                  textAlign: TextAlign.left,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700)),
                          const Gap(height: 16),
                          TextView(
                              config: TextViewConfig(
                                  text: 'Please sign up to get started!',
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400)),
                          const Gap(height: 23),
                          EditFormField(
                              config: EditFieldConfig(
                                  hint: 'Firstname',
                                  focusNode: firstNameFocusNode,
                                  validator: FieldValidator.validateString(),
                                  controller: firstNameController)),
                          const Gap(height: 16),
                          EditFormField(
                              config: EditFieldConfig(
                                  hint: 'Lastname',
                                  validator: FieldValidator.validateString(),
                                  controller: lastNameController)),
                          const Gap(height: 16),
                          EditFormField(
                              config: EditFieldConfig(
                                  hint: 'Email',
                                  validator: FieldValidator.validateEmail(),
                                  controller: emailController)),
                          const Gap(height: 16),
                          EditFormField(
                              config: EditFieldConfig(
                                  hint: 'Phone',
                                  validator: FieldValidator.validatePhone(),
                                  controller: phoneController)),
                          const Gap(height: 16),
                          EditFormField(
                              config: EditFieldConfig(
                                  hint: 'Password',
                                  obscureText: true,
                                  validator: FieldValidator.validatePlainPass(),
                                  controller: passwordController)),
                          const Gap(height: 23),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: TextView(
                                    config: TextViewConfig(
                                        text: 'Already have an account? ')),
                              ),
                              Flexible(
                                child: TextView(
                                    config: TextViewConfig(
                                        text: 'Login',
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                        onTap: () => PageRouter.pushNamed(
                                            Routes.signinView))),
                              )
                            ],
                          )
                        ],
                      )),
                      ButtonWidget(
                          config: ButtonConfig(
                              text: 'Sign up',
                              textColor: AppColors.white,
                              loading: viewmodel.isBusy,
                              onPressed: () {
                                if (viewmodel.formKey.currentState!
                                    .validate()) {
                                  viewmodel.submitForm(AuthEntity(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      password: passwordController.text));
                                }
                              })),
                    ],
                  ),
                ))));
  }
}
