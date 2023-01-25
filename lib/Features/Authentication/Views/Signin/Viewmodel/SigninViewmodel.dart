import 'package:bexit/Core/App/App.router.dart';
import 'package:bexit/Core/App/AppExports.dart';
import 'package:bexit/Core/Router/PageRouterExports.dart';
import 'package:bexit/Core/Utils/AppUiComponents.dart';
import 'package:bexit/Features/Authentication/Domain/Repository/AuthRepositoryImpl.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../Core/Manager/SessionManager.dart';
import '../../../Domain/Entity/AuthEntity.dart';

class SigninViewmodel extends FormViewModel {
  final mLogger = getLogger('SigninViewmodel');
  final formKey = GlobalKey<FormState>();

  final authImpl = locator<AuthRepositoryImpl>();
  final session = locator<SessionManager>();

  Future<void> submitForm(AuthEntity entity) async {
    try {
      final response =
          await runBusyFuture(authImpl.signin(entity), throwException: true);
      session.isLoggedIn = true;
      session.authToken = response?.token ?? '';
      session.userInfo = response?.userModel?.toJson() ?? {};
      AppUiComponents.triggerNotification(response?.message ?? 'Successful');
      PageRouter.pushReplacement(Routes.profileView);
    } catch (e) {
      mLogger.e('Error: $e');
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }
}
