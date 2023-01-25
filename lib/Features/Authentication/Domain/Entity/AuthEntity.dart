class AuthEntity {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? password;
  final String? code;
  final String? currentPassword;
  final String? newPassword;

  AuthEntity(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.password,
      this.code,
      this.currentPassword,
      this.newPassword});

  Map<String, dynamic> toMap() => {
        if (firstName != null) 'firstname': firstName,
        if (lastName != null) 'lastname': lastName,
        if (phone != null) 'phone': phone,
        if (email != null) 'email': email,
        if (password != null) 'password': password,
        if (code != null) 'code': code,
        if (currentPassword != null) 'currentPassword': currentPassword,
        if (newPassword != null) 'newPassword': newPassword
      };
}
