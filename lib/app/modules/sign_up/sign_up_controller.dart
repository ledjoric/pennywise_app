import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/models/register_data.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class SignUpController extends GetxController {
  var emailError = ''.obs;
  var mobileError = ''.obs;

  final formKey = GlobalKey<FormState>();

  void signUpUser({required RegisterData data}) {
    DioRequest.register(data).then((value) {
      if (value != null) {
        emailError.value = value['email'].toString();
        mobileError.value = value['mobile'].toString();
      } else {
        emailError.value = '';
        mobileError.value = '';
      }
      if (formKey.currentState!.validate()) {}
    });
  }

  String? passwordValidate(String? value, String password) {
    if (value != password) {
      return 'Password did not match';
    } else if (value == null || value.isEmpty) {
      return 'Please add some text';
    } else {
      return null;
    }
  }

  String? emailValidate(String? value) {
    if (!value!.isEmail) {
      return 'Please enter a correct email format.';
    } else if (emailError.isNotEmpty) {
      return 'The email has already been taken.';
    } else if (value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? mobileValidate(String? value) {
    if (value!.isEmpty) {
      return 'Please enter you mobile number';
    } else if (mobileError.isNotEmpty) {
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
      return 'Please add some text';
    } else {
      return null;
    }
  }
}
