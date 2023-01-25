import 'package:bexit/Core/App/App.router.dart';
import 'package:bexit/Core/App/AppExports.dart';
import 'package:bexit/Core/Router/PageRouterExports.dart';
import 'package:bexit/Core/Utils/AppUiComponents.dart';
import 'package:bexit/Features/Authentication/Domain/Repository/AuthRepositoryImpl.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../Domain/Entity/AuthEntity.dart';

class SignupViewmodel extends FormViewModel {
  final mLogger = getLogger('SignupViewmodel');
  final formKey = GlobalKey<FormState>();

  final authImpl = locator<AuthRepositoryImpl>();

  Future<void> submitForm(AuthEntity entity) async {
    try {
      final response =
          await runBusyFuture(authImpl.signup(entity), throwException: true);
      AppUiComponents.triggerNotification(response?.message ?? 'Successful');
      PageRouter.pushReplacement(Routes.verificationView);
    } catch (e) {
      mLogger.e('Error: $e');
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }
}
