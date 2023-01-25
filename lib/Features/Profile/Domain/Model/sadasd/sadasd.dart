import 'user.dart';

class Sadasd {
  String? status;
  String? message;
  User? user;

  Sadasd({this.status, this.message, this.user});

  factory Sadasd.fromJson(Map<String, dynamic> json) => Sadasd(
        status: json['status'] as String?,
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'user': user?.toJson(),
      };
}
