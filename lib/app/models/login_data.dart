class LoginData {
  String mobile = '';
  String password = '';

  LoginData({
    required this.mobile,
    required this.password,
  });

  LoginData.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['password'] = password;
    return data;
  }
}
