import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/user_controller.dart';
import 'package:pennywise_app/app/models/user_data.dart';
import 'package:pennywise_app/app/routes/route_names.dart';

class VerifyController extends GetxController {
  final _auth = FirebaseAuth.instance;

  var verificationId = '';
  var phoneNumber = '';
  bool isRegister = false;

  late UserData userData = UserData();
  var userContoller = Get.put(UserController());

  // var otpController = TextEditingController().obs;

  void verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credentials) async {
          // await _auth.signInWithCredential(credentials);
        },
        verificationFailed: (e) {},
        codeSent: ((verificationId, forceResendingToken) {
          this.verificationId = verificationId;
        }),
        codeAutoRetrievalTimeout: (verificationId) {});
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
          Get.offAllNamed(logIn);
        } else {
          Get.offAllNamed(dashBoard);
          userContoller.saveUserData(userData);

          userContoller.getUserData().then(
            (value) {
              if (value != null) {
                print('MAY LAMAN SYA EYY');
              }
            },
          );
        }
      }
    } on Exception {
      Get.snackbar(
        'Verification Failed',
        'Sorry, the OTP entered is invalid. Please try again.',
      );
    }
  }
}
