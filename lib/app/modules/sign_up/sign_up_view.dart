import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';
import 'package:pennywise_app/app/models/register_data.dart';
import 'package:pennywise_app/app/modules/sign_up/sign_up_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPWController = TextEditingController();

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignUpController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextFormField(
                    validator: (value) => controller.textFieldValidate(value),
                    label: 'First name',
                    icon: Icons.person_rounded,
                    controller: firstNameController,
                  ),
                  AppTextFormField(
                    validator: (value) => controller.textFieldValidate(value),
                    label: 'Last name',
                    icon: Icons.person_rounded,
                    controller: lastNameController,
                  ),
                  AppTextFormField(
                    validator: (value) => controller.emailValidate(value),
                    label: 'Email',
                    icon: Icons.alternate_email_rounded,
                    controller: emailController,
                  ),
                  AppTextFormField(
                    validator: (value) => controller.mobileValidate(value),
                    label: 'Phone number',
                    icon: Icons.phone_android_rounded,
                    controller: phoneNumberController,
                  ),
                  AppTextFormField(
                    validator: (value) => controller.passwordValidate(
                      value,
                      confirmPWController.text,
                    ),
                    label: 'Password',
                    icon: Icons.lock_rounded,
                    controller: passwordController,
                    obscureText: true,
                  ),
                  AppTextFormField(
                    validator: (value) => controller.passwordValidate(
                      value,
                      passwordController.text,
                    ),
                    label: 'Re-enter password',
                    icon: Icons.lock_rounded,
                    controller: confirmPWController,
                    obscureText: true,
                  ),
                  AppFilledButton(
                    text: 'Sign Up',
                    color: tertiaryColor,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.signUpUser(
                          data: RegisterData(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            mobile: int.parse(phoneNumberController.text),
                            password: passwordController.text,
                            confirmPassword: confirmPWController.text,
                            token: 'jsbfjabbfa1827391hkj',
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
