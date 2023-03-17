class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  int? balance;
  int? isVerified;
  String? filesToken;

  UserData(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.balance,
      this.isVerified,
      this.filesToken});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    email = json['email'];
    balance = json['balance'];
    isVerified = json['isVerified'];
    filesToken = json['filesToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['balance'] = balance;
    data['isVerified'] = isVerified;
    data['filesToken'] = filesToken;
    return data;
  }
}
