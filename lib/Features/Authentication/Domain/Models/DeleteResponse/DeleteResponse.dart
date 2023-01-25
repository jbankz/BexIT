class DeleteResponse {
  String? status;
  String? message;

  DeleteResponse({this.status, this.message});

  factory DeleteResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
