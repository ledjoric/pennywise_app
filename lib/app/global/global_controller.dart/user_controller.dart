import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pennywise_app/app/models/user_data.dart';

class UserController extends GetxController {
  var userData = UserData();
  final data = GetStorage();

  Future<bool> saveUserData(UserData userData) async {
    deleteUserData();
    String userDataJson = jsonEncode(userData.toJson());
    data.write('userData', userDataJson);

    // retrieve the saved data and compare it to the original
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
    print('REMOVED');
  }
}
