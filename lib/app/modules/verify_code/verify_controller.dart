import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  final _auth = FirebaseAuth.instance;

  var verificationId = ''.obs;
  var phoneNumber = '+639297888742'.obs;

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

  Future<bool> verifyOTP({required String code}) async {
    var credentials =
        await _auth.signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId.value,
      smsCode: code,
    ));

    return credentials.user != null ? true : false;
  }
}
