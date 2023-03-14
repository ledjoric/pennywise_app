class RegisterErrors {
  Errors? errors;

  RegisterErrors({this.errors});

  RegisterErrors.fromJson(Map<String, dynamic> json) {
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errors != null) {
      data['errors'] = errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? mobile;
  List<String>? email;
  List<String>? password;

  Errors({this.mobile, this.email, this.password});

  Errors.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'].cast<String>();
    email = json['email'].cast<String>();
    password = json['password'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
