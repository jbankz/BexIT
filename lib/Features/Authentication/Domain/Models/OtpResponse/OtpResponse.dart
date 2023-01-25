import '../../../../Profile/Domain/Model/UserModel.dart';

class OtpResponse {
  String? status;
  String? message;
  String? token;
  UserModel? userModel;

  OtpResponse({this.status, this.message, this.token, this.userModel});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
        status: json['status'] as String?,
        message: json['message'] as String?,
        token: json['token'] as String?,
        userModel: UserModel.fromJson(json['user']));
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'token': token,
        'user': userModel?.toJson()
      };
}
