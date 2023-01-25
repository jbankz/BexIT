import 'package:bexit/Features/Authentication/Domain/Entity/AuthEntity.dart';
import '../Models/OtpResponse/OtpResponse.dart';
import '../Models/PasswordResponse/PasswordResponse.dart';
import '../Models/SignInResponse/SignIpResponse.dart';
import '../Models/SignupResponse/SignUpResponse.dart';

abstract class AuthRepository {
  Future<SignUpResponse?> signup(AuthEntity entity);
  Future<SignInResponse?> signin(AuthEntity entity);
  Future<OtpResponse?> requestOTP(AuthEntity entity);
  Future<OtpResponse?> verifyOTP(AuthEntity entity);
  Future<PasswordResponse?> forgotPassword(AuthEntity entity);
  Future<PasswordResponse?> updatePassword(AuthEntity entity);
}
