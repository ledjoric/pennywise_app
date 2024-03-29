import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/strings.dart';
import 'package:pennywise_app/app/global/user_controller.dart';
import 'package:pennywise_app/app/models/login_data.dart';
import 'package:pennywise_app/app/models/user_data.dart';
import 'package:pennywise_app/app/modules/verify_code/verify_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController with WidgetsBindingObserver {
  var verifyController = Get.put(VerifyController());
  // var userContoller = Get.put(UserController());
  final _userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _userController.deleteUserData();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.detached) {
      _userController.deleteUserData();
    }
  }

  void login({required LoginData data, required String phoneNumber}) {
    DioRequest.login(data).then((value) {
      if (value != null) {
        Get.toNamed(verifyCode);
        verifyController.phoneNumber = '+63${phoneNumber.trim()}';
        verifyController.verifyPhoneNumber();
        verifyController.userData = value;
      } else {
        Get.snackbar(
          'Login Failed',
          'Your email/password is incorrect',
          colorText: secondaryColor,
          backgroundColor: Colors.grey[300],
          // leftBarIndicatorColor: tertiaryColor,
          duration: const Duration(seconds: 2),
          borderRadius: 20,
        );
        print('LOGIN FAILED');
        return;
      }
    });
  }

  String? textFieldValidate(String? value) {
    if (value == null || value.isEmpty) {
      return emptyTextFieldError;
    }
    return null;
  }

  String? mobileValidate(String? value) {
    if (value == null || value.isEmpty) {
      return emptyTextFieldError;
    } else if (value.length < 10) {
      return mobileNumberError;
    }
    return null;
  }
}
