import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPWController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextFormField(
              hint: 'First name',
              icon: Icons.person_rounded,
              controller: firstNameController,
            ),
            AppTextFormField(
              hint: 'Last name',
              icon: Icons.person_rounded,
              controller: lastNameController,
            ),
            AppTextFormField(
              hint: 'Phone number',
              icon: Icons.phone_android_rounded,
              controller: phoneNumberController,
            ),
            AppTextFormField(
              hint: 'Password',
              icon: Icons.lock_rounded,
              controller: passwordController,
              obscureText: true,
            ),
            AppTextFormField(
              hint: 'Re-enter password',
              icon: Icons.lock_rounded,
              controller: confirmPWController,
              obscureText: true,
            ),
            AppFilledButton(
              text: 'Sign Up',
              color: tertiaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
