import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/dimensions.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/models/login_data.dart';
import 'package:pennywise_app/app/modules/verify_code/verify_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class LoginController extends GetxController {
  var verifyController = Get.put(VerifyController());

  void login({required LoginData data, required String phoneNumber}) {
    DioRequest.login(data).then((value) {
      if (value) {
        Get.toNamed(verifyCode);
        verifyController.phoneNumber.value = '+63${phoneNumber.trim()}';
        verifyController.verifyPhoneNumber();
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
      return 'Please enter some text';
    }
    return null;
  }
}
