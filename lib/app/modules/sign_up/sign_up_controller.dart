import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/strings.dart';
import 'package:pennywise_app/app/models/register_data.dart';
import 'package:pennywise_app/app/modules/verify_code/verify_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class SignUpController extends GetxController {
  var emailError = ''.obs;
  var mobileError = ''.obs;

  final formKey = GlobalKey<FormState>();
  var verifyController = Get.put(VerifyController());

  void signUpUser({required RegisterData data, String phoneNumber = ''}) {
    DioRequest.register(data).then((value) {
      if (value != null) {
        emailError.value = value['email'].value;
        mobileError.value = value['mobile'].toString();
      } else {
        emailError.value = '';
        mobileError.value = '';
      }

      if (formKey.currentState!.validate()) {
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
      return 'This is an invalid phone number';
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
