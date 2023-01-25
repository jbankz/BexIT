class PasswordResponse {
  String? status;
  String? message;

  PasswordResponse({this.status, this.message});

  factory PasswordResponse.fromJson(Map<String, dynamic> json) {
    return PasswordResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
