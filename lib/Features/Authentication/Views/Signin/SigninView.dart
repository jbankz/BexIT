import 'package:bexit/Common/CommonExports.dart';
import 'package:bexit/Core/Utils/FieldValidator.dart';
import 'package:bexit/Features/Authentication/Domain/Entity/AuthEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../Assets/AppColors.dart';
import '../../../../Core/App/App.router.dart';
import '../../../../Core/Router/PageRouter.dart';
import 'SigninView.form.dart';
import 'Viewmodel/SigninViewmodel.dart';

@FormView(
    fields: [FormTextField(name: 'email'), FormTextField(name: 'password')])
class SigninView extends StatelessWidget with $SigninView {
  SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SigninViewmodel>.reactive(
        viewModelBuilder: () => SigninViewmodel(),
        onViewModelReady: (viewModel) {
          syncFormWithViewModel(viewModel);
          emailFocusNode.requestFocus();
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
                                  text: 'Welcome back!',
                                  textAlign: TextAlign.left,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700)),
                          const Gap(height: 16),
                          TextView(
                              config: TextViewConfig(
                                  text: 'Please sign in!',
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400)),
                          const Gap(height: 23),
                          EditFormField(
                              config: EditFieldConfig(
                                  hint: 'Email',
                                  focusNode: emailFocusNode,
                                  validator: FieldValidator.validateEmail(),
                                  controller: emailController)),
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
                                        text: 'Don\'t have an account? ')),
                              ),
                              Flexible(
                                child: TextView(
                                    config: TextViewConfig(
                                  text: 'Sign up',
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  onTap: () => PageRouter.pushReplacement(
                                      Routes.signupView),
                                )),
                              )
                            ],
                          )
                        ],
                      )),
                      ButtonWidget(
                          config: ButtonConfig(
                              text: 'Sign in',
                              textColor: AppColors.white,
                              loading: viewmodel.isBusy,
                              onPressed: () {
                                if (viewmodel.formKey.currentState!
                                    .validate()) {
                                  viewmodel.submitForm(AuthEntity(
                                      email: emailController.text,
                                      password: passwordController.text));
                                }
                              })),
                    ],
                  ),
                ))));
  }
}
