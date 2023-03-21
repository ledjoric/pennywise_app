class RegisterValidate {
  String? mobile;
  String? email;

  RegisterValidate({
    required this.mobile,
    required this.email,
  });

  RegisterValidate.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['email'] = email;
    return data;
  }
}
