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

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(VerifyController());
    return Scaffold(
      body: Padding(
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
            const SizedBox(height: 30),
            const AppRegularText(
              text:
                  'Verify your account by Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              color: secondaryColor,
            ),
            const SizedBox(height: 30),
            PInput(
              controller: otpController,
            ),
            const SizedBox(height: 30),
            AppFilledButton(
              text: 'Verify',
              color: tertiaryColor,
              onPressed: () {
                controller.verifyPhoneNumber();
              },
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppRegularText(
                  text: 'Resend code in',
                  color: tertiaryColor,
                ),
                AppRegularText(
                  text: ' 00:00',
                  color: tertiaryColor,
                  onTap: () {
                    //placeholder
                    debugPrint("Register");
                  },
                  style: kBoldTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
