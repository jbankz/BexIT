import 'dart:convert';

import 'package:bexit/Features/Authentication/Domain/Models/PasswordResponse/PasswordResponse.dart';
import 'package:bexit/Features/Authentication/Domain/Models/OtpResponse/OtpResponse.dart';
import 'package:bexit/Features/Authentication/Domain/Models/SignInResponse/SignIpResponse.dart';
import 'package:bexit/Features/Authentication/Domain/Models/SignupResponse/SignUpResponse.dart';
import 'package:bexit/Features/Authentication/Domain/Entity/AuthEntity.dart';
import 'package:bexit/Features/Authentication/Domain/Repository/AuthRepository.dart';
import 'package:bexit/Features/Profile/Domain/Model/UserModel.dart';

import '../../../../Core/CoreExports.dart';

class AuthRepositoryImpl extends NetworkService implements AuthRepository {
  @override
  Future<SignUpResponse?> signup(AuthEntity entity) async {
    try {
      final response = await request(
          path: UrlPath.signup,
          method: RequestMethod.post,
          data: entity.toMap());
      return SignUpResponse.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<SignInResponse?> signin(AuthEntity entity) async {
    try {
      final response = await request(
          path: UrlPath.signin,
          method: RequestMethod.post,
          data: entity.toMap());
      return SignInResponse.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PasswordResponse?> forgotPassword(AuthEntity entity) async {
    try {
      await request(
          path: UrlPath.forgotPassword,
          method: RequestMethod.post,
          data: entity.toMap());
      return PasswordResponse();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<OtpResponse?> requestOTP(AuthEntity entity) async {
    try {
      await request(
          path: UrlPath.requestOTP,
          method: RequestMethod.post,
          data: entity.toMap());
      return OtpResponse();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<OtpResponse?> verifyOTP(AuthEntity entity) async {
    try {
      final response = await request(
          path: UrlPath.verifyOTP,
          method: RequestMethod.get,
          queryParams: entity.toMap());
      return OtpResponse.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PasswordResponse?> updatePassword(AuthEntity entity) async {
    try {
      final user = UserModel.fromJson(locator<SessionManager>().userInfo);

      print('JAYCEE: ${locator<SessionManager>().isLoggedIn}');

      final response = await request(
          path: UrlPath.updatePassword,
          method: RequestMethod.post,
          data: {...entity.toMap(), 'userId': user.id});
      return PasswordResponse.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }
}
