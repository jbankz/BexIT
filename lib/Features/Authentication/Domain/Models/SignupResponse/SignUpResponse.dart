class SignUpResponse {
  String? status;
  String? message;

  SignUpResponse({this.status, this.message});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
