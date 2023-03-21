import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';
import 'package:pennywise_app/app/global/widgets/logo_container.dart';
import 'package:pennywise_app/app/global/widgets/pinput.dart';
import 'package:pennywise_app/app/modules/verify_code/verify_controller.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VerifyViewState createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  final otpController = TextEditingController();

  final _controller = Get.put(VerifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LogoContainer(),
                const SizedBox(height: 20),
                const AppHeaderText(text: 'verification'),
                const AppHeaderText(
                  text: 'code',
                  style: kBoldHeaderStyle,
                ),
                const SizedBox(height: 20),
                const RedBox(),
                const SizedBox(height: 40),
                const AppRegularText(
                  text:
                      'Please enter the OTP code sent to your registered mobile number to verify your mobile number. This code is valid for 30 seconds. Once verified, you will have access to your account.',
                  color: secondaryColor,
                  align: TextAlign.left,
                ),
                const SizedBox(height: 40),
                PInput(
                  controller: otpController,
                ),
                const SizedBox(height: 60),
                AppFilledButton(
                  text: 'Verify',
                  color: tertiaryColor,
                  onPressed: () {
                    // controller.verifyPhoneNumber();
                    _controller.verifyOTP(
                      code: otpController.text,
                    );
                  },
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppRegularText(
                      text: 'Resend code in   ',
                      color: tertiaryColor,
                    ),
                    Obx(
                      () => AppRegularText(
                        text: _controller.seconds.value > 0
                            ? _controller.seconds.value.toString()
                            : 'Resend Code',
                        color: tertiaryColor,
                        onTap: _controller.seconds.value > 0
                            ? null
                            : _controller.resendOTP,
                        style: kBoldTextStyle,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
