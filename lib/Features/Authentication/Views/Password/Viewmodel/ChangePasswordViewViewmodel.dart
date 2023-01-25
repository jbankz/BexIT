import 'package:bexit/Core/Utils/AppUiComponents.dart';
import 'package:bexit/Features/Authentication/Domain/Repository/AuthRepositoryImpl.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../Core/CoreExports.dart';
import '../../../Domain/Entity/AuthEntity.dart';

class ChangePasswordViewViewmodel extends FormViewModel {
  final mLogger = getLogger('ChangePasswordViewViewmodel');
  final formKey = GlobalKey<FormState>();

  final authImpl = locator<AuthRepositoryImpl>();
  final session = locator<SessionManager>();

  Future<void> submitForm(AuthEntity entity) async {
    try {
      final response = await runBusyFuture(authImpl.updatePassword(entity),
          throwException: true);
      AppUiComponents.triggerNotification(response?.message ?? 'Successful');
    } catch (e) {
      mLogger.e('Error: $e');
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }
}
