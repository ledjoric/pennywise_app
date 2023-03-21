import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/strings.dart';
import 'package:pennywise_app/app/models/register_data.dart';
import 'package:pennywise_app/app/models/register_validate_data.dart';
import 'package:pennywise_app/app/modules/verify_code/verify_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class SignUpController extends GetxController {
  var emailError = ''.obs;
  var mobileError = ''.obs;

  final formKey = GlobalKey<FormState>();
  var verifyController = Get.put(VerifyController());

  void validateUser(
      {required RegisterValidate validate,
      required RegisterData data,
      String phoneNumber = ''}) {
    DioRequest.registerValidate(validate).then((value) {
      if (value != null) {
        emailError.value =
            value['email'] == null ? '' : value['email'].toString();
        mobileError.value =
            value['mobile'] == null ? '' : value['mobile'].toString();
      } else {
        emailError.value = '';
        mobileError.value = '';
      }

      if (formKey.currentState!.validate()) {
        verifyController.isRegister = true;
        verifyController.registerData = data;
        verifyController.phoneNumber = '+63${phoneNumber.trim()}';
        verifyController.verifyPhoneNumber();
        Get.toNamed(verifyCode);
      }
    });
  }

  String? passwordValidate(String? value, String password) {
    if (value != password) {
      return 'Password did not match';
    } else if (value == null || value.isEmpty) {
      return emptyTextFieldError;
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else {
      return null;
    }
  }

  String? emailValidate(String? value) {
    if (!value!.isEmail) {
      return 'Please enter a correct email format.';
    } else if (emailError.isNotEmpty) {
      emailError.value = '';
      return 'The email has already been taken.';
    } else if (value.isEmpty) {
      return emptyTextFieldError;
    }
    return null;
  }

  String? mobileValidate(String? value) {
    if (value!.isEmpty) {
      return emptyTextFieldError;
    } else if (mobileError.isNotEmpty) {
      mobileError.value = '';
      return 'The mobile number has already been taken.';
    } else if (value.length < 10 && value.isNotEmpty) {
      return 'The mobile number must be at least 10 characters.';
    } else if (!value.isNum) {
      return 'Please enter a valid phone number, example: 9123456789';
    } else if (value.isNotEmpty && value[0] != '9') {
      return 'The mobile number must start with the digit 9. Please enter a valid phone number, example: 9123456789';
    }
    return null;
  }

  String? textFieldValidate(String? value) {
    if (value == null || value.isEmpty) {
      return emptyTextFieldError;
    } else {
      return null;
    }
  }
}
