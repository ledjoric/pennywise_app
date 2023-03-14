import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/routes/route_names.dart';

class VerifyController extends GetxController {
  final _auth = FirebaseAuth.instance;

  var verificationId = ''.obs;
  var phoneNumber = ''.obs;

  // var otpController = TextEditingController().obs;

  void verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber.value,
        verificationCompleted: (credentials) async {
          // await _auth.signInWithCredential(credentials);
        },
        verificationFailed: (e) {},
        codeSent: ((verificationId, forceResendingToken) {
          this.verificationId.value = verificationId;
        }),
        codeAutoRetrievalTimeout: (verificationId) {});
  }

  Future<void> verifyOTP({required String code}) async {
    try {
      var credentials =
          await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: code,
      ));

      if (credentials.user != null) {
        Get.toNamed(logIn);
      }
    } on Exception catch (e) {
      Get.snackbar(
        'Verification Failed',
        'Sorry, the OTP entered is invalid. Please try again.',
      );
    }

    // return credentials.user != null ? true : false;
  }
}
