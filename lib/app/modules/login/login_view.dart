import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';
import 'package:pennywise_app/app/global/widgets/logo_container.dart';
import 'package:pennywise_app/app/models/login_data.dart';
import 'package:pennywise_app/app/modules/login/login_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
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
                const AppHeaderText(
                  text: 'sign in to',
                ),
                const AppHeaderText(
                  text: 'pennywise.',
                  style: kBoldHeaderStyle,
                ),
                const SizedBox(height: 20),
                const RedBox(),
                const SizedBox(height: 60),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextFormField(
                        isLimited: true,
                        validator: (value) =>
                            controller.textFieldValidate(value),
                        hint: 'Phone number...',
                        icon: Icons.phone_android_rounded,
                        controller: phoneNumberController,
                      ),
                      const SizedBox(height: 20),
                      AppTextFormField(
                        isLimited: false,
                        validator: (value) =>
                            controller.textFieldValidate(value),
                        hint: 'Password...',
                        icon: Icons.lock_rounded,
                        controller: passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      AppFilledButton(
                        text: 'Sign In',
                        color: tertiaryColor,
                        onPressed: () {
                          controller.login(
                            data: LoginData(
                              mobile: phoneNumberController.text,
                              password: passwordController.text,
                            ),
                            phoneNumber: phoneNumberController.text,
                          );
                        },
                      ),
                      const SizedBox(height: 60),
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
                              Get.toNamed(signUp);
                            },
                            style: kBoldTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
