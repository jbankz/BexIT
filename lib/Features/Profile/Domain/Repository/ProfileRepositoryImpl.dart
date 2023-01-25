import 'dart:io';

import 'package:bexit/Features/Authentication/Domain/Models/SignInResponse/SignIpResponse.dart';
import 'package:bexit/Features/Profile/Domain/Model/UserModel.dart';
import 'package:dio/dio.dart';

import '../../../../Core/CoreExports.dart';
import '../../../Authentication/Domain/Models/DeleteResponse/DeleteResponse.dart';
import 'ProfileRepository.dart';

class ProfileRepositoryImpl extends NetworkService
    implements ProfileRepository {
  final user = UserModel.fromJson(locator<SessionManager>().userInfo);
  @override
  Future<UserModel?> profile() async {
    try {
      final response = await request(
          path: UrlPath.profile,
          method: RequestMethod.post,
          data: {'userId': user.id});
      return UserModel.fromJson(response.data['user']);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> updatePic(File file) async {
    try {
      String fileName = file.path.split('/').last;

      final response = await request(
          path: UrlPath.editProfile,
          method: RequestMethod.upload,
          formData: FormData.fromMap({
            'userId': user.id,
            'avatar':
                await MultipartFile.fromFile(file.path, filename: fileName)
          }));
      return UserModel.fromJson(response.data['user']);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<DeleteResponse?> deleteAccount() async {
    try {
      final response =
          await request(path: UrlPath.deleteAccount, method: RequestMethod.get);
      return DeleteResponse.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }
}
