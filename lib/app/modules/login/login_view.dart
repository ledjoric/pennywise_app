import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';
import 'package:pennywise_app/app/global/widgets/logo_container.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LogoContainer(),
            SizedBox(height: 20),
            const AppHeaderText(
              text: 'sign in to',
            ),
            const AppHeaderText(
              text: 'pennywise.',
              style: kBoldHeaderStyle,
            ),
            SizedBox(height: 20),
            RedBox(),
            SizedBox(height: 60),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextFormField(
                  hint: 'Phone number...',
                  icon: Icons.phone_android_rounded,
                  controller: phoneNumberController,
                ),
                SizedBox(height: 20),
                AppTextFormField(
                  hint: 'Password...',
                  icon: Icons.lock_rounded,
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                AppFilledButton(
                  text: 'Sign In',
                  color: tertiaryColor,
                  onPressed: () {
                    //placeholder
                    debugPrint("Login");
                  },
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppRegularText(
                      text: 'Don\'t have an account?',
                      color: tertiaryColor,
                    ),
                    AppRegularText(
                      text: ' Register.',
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
          ],
        ),
      ),
    );
  }
}