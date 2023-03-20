import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pennywise_app/app/models/login_data.dart';
import 'package:pennywise_app/app/models/user_data.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class UserController extends GetxController {
  var userData = UserData();
  var userCredentials = LoginData(mobile: '', password: '');
  final data = GetStorage();

  // USER DATA
  Future<bool> saveUserData(UserData userData) async {
    deleteUserData();
    String userDataJson = jsonEncode(userData.toJson());
    data.write('userData', userDataJson);

    String savedUserDataJson = data.read('userData');
    bool isSaved = savedUserDataJson == userDataJson;
    print(isSaved);
    return isSaved;
  }

  UserData? getUserData() {
    String? userDataJson = data.read('userData');

    if (userDataJson != null) {
      userData = UserData.fromJson(jsonDecode(userDataJson));
      return userData;
    }
    return null;
  }

  void deleteUserData() {
    data.remove('userData');
  }

  // CREDENTIALS
  Future<bool> saveCredentials(LoginData loginData) async {
    deleteCredentials();
    String userCredJson = jsonEncode(loginData.toJson());
    data.write('userCredentials', userCredJson);

    String savedUserDataJson = data.read('userCredentials');
    bool isSaved = savedUserDataJson == userCredJson;
    print(isSaved);
    return isSaved;
  }

  LoginData? getCredentials() {
    String? userCredJson = data.read('userCredentials');

    if (userCredJson != null) {
      userCredentials = LoginData.fromJson(jsonDecode(userCredJson));
      return userCredentials;
    }
    return null;
  }

  void deleteCredentials() {
    data.remove('userCredentials');
  }

  Future fetchUserData() async {
    getCredentials();
    DioRequest.login(userCredentials).then((value) {
      if (value != null) {
        saveUserData(value);
      }
    });
  }
}
