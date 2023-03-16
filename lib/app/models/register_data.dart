class RegisterData {
  String? firstName;
  String? lastName;
  String? email;
  int? mobile;
  String? password;
  String? confirmPassword;
  String? token;

  RegisterData(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.mobile,
      required this.password,
      required this.confirmPassword,
      required this.token});

  RegisterData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    token = json['filesToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['password'] = password;
    data['confirm_password'] = confirmPassword;
    data['filesToken'] = token;
    return data;
  }
}
