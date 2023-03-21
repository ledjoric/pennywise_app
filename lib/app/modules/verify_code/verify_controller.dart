import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/global_controller.dart/user_controller.dart';
import 'package:pennywise_app/app/models/register_data.dart';
import 'package:pennywise_app/app/models/user_data.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class VerifyController extends GetxController {
  final _auth = FirebaseAuth.instance;

  var phoneNumber = '';
  var verificationId = '';
  bool isRegister = false;

  static const maxSeconds = 30;
  RxInt seconds = maxSeconds.obs;
  Timer? timer;

  UserData userData = UserData();
  RegisterData registerData = RegisterData(
    firstName: '',
    lastName: '',
    email: '',
    mobile: 0,
    password: '',
    confirmPassword: '',
    token: '',
  );
  var userContoller = Get.put(UserController());

  @override
  void onInit() {
    // verifyPhoneNumber();
    startTimer();
    super.onInit();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        seconds--;
      } else {
        stopTimer();
      }
    });
  }

  void resendOTP() {
    seconds.value = maxSeconds;
    startTimer();
    verifyPhoneNumber();
  }

  void stopTimer() {
    timer?.cancel();
  }

  void verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credentials) async {
          // await _auth.signInWithCredential(credentials);
          print(credentials);
        },
        verificationFailed: (e) {
          print(e);
        },
        codeSent: ((verificationId, forceResendingToken) {
          this.verificationId = verificationId;
        }),
        codeAutoRetrievalTimeout: (verificationId) {
          print(verificationId);
        });
  }

  Future<void> verifyOTP({required String code}) async {
    try {
      var credentials =
          await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      ));

      if (credentials.user != null) {
        if (isRegister) {
          isRegister = false;
          signUpUser(data: registerData);
        } else {
          userContoller.saveUserData(userData).then(
                (value) => Get.offAllNamed(dashBoard),
              );
        }
      }
    } on Exception {
      Get.snackbar(
        'Verification Failed',
        'Sorry, the OTP entered is invalid. Please try again.',
        colorText: secondaryColor,
        backgroundColor: Colors.grey[300],
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 500),
        borderRadius: 20,
      );
    }
  }

  void signUpUser({required RegisterData data}) async {
    DioRequest.register(data).then((value) {
      if (value == null) {
        Get.offAllNamed(logIn);
      } else {
        Get.snackbar(
          'Registration Failed: Internal Server Error',
          'We are sorry, but our server encountered an unexpected problem.',
          colorText: secondaryColor,
          backgroundColor: Colors.grey[300],
          duration: const Duration(seconds: 2),
          animationDuration: const Duration(milliseconds: 500),
          borderRadius: 20,
        );
      }
    });
  }
}
