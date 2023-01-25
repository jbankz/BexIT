import 'dart:io';

import 'package:bexit/Core/App/App.router.dart';
import 'package:bexit/Core/App/AppExports.dart';
import 'package:bexit/Core/Manager/SessionManager.dart';
import 'package:bexit/Core/Router/PageRouterExports.dart';
import 'package:bexit/Features/Profile/Domain/Model/UserModel.dart';
import 'package:images_picker/images_picker.dart';
import 'package:stacked/stacked.dart';

import '../../../../Core/Manager/PhotoManager.dart';
import '../../../../Core/Utils/AppUiComponents.dart';
import '../../Domain/Repository/ProfileRepositoryImpl.dart';

class ProfileViewmodel extends BaseViewModel {
  final session = locator<SessionManager>();
  final photoPicker = locator<PhotoManager>();
  final profileImpl = locator<ProfileRepositoryImpl>();

  File? _imageFile;
  File? get imageFile => _imageFile;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future<void> profile() async {
    try {
      _userModel = await runBusyFuture(profileImpl.profile());
    } catch (e) {
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteAccount() async {
    try {
      final response = await runBusyFuture(profileImpl.deleteAccount());
      if (response?.status != null) {
        await runBusyFuture(session.logOut());
        PageRouter.pushReplacement(Routes.signinView);
      }
    } catch (e) {
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
  }

  void pickImage() async {
    try {
      List<Media>? image = await photoPicker.pickImage() ?? [];
      if (image.isNotEmpty) {
        _imageFile = File(image.first.path);
        notifyListeners();

        await runBusyFuture(profileImpl.updatePic(_imageFile!));
        AppUiComponents.triggerNotification('avatar uploaded successful');
      }
    } catch (e) {
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
  }
}
