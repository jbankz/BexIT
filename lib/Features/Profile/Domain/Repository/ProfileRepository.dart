import 'dart:io';

import 'package:bexit/Features/Profile/Domain/Model/UserModel.dart';

import '../../../Authentication/Domain/Models/DeleteResponse/DeleteResponse.dart';

abstract class ProfileRepository {
  Future<UserModel?> updatePic(File file);
  Future<UserModel?> profile();
  Future<DeleteResponse?> deleteAccount();
}
