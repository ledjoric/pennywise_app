import 'dart:convert';

import 'package:get/get.dart';
import 'package:pennywise_app/app/models/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var userData = UserData();

  void saveUserData(UserData userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataJson = jsonEncode(userData.toJson());
    await prefs.setString('userData', userDataJson);
  }

  Future<UserData?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataJson = prefs.getString('userData');

    if (userDataJson != null) {
      userData = UserData.fromJson(jsonDecode(userDataJson));
      return userData;
    }

    return null;
  }

  void deleteUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    print('REMOVED');
  }
}
