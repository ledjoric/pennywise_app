import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';
import 'package:pennywise_app/app/models/register_data.dart';
import 'package:pennywise_app/app/modules/sign_up/sign_up_controller.dart';
import 'package:pennywise_app/app/modules/verify_code/verify_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';

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
    var verifyController = Get.put(VerifyController());
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
                    isLimited: false,
                    validator: (value) => controller.textFieldValidate(value),
                    hint: 'First name',
                    icon: Icons.person_rounded,
                    controller: firstNameController,
                  ),
                  AppTextFormField(
                    isLimited: false,
                    validator: (value) => controller.textFieldValidate(value),
                    hint: 'Last name',
                    icon: Icons.person_rounded,
                    controller: lastNameController,
                  ),
                  AppTextFormField(
                    isLimited: false,
                    validator: (value) => controller.emailValidate(value),
                    hint: 'Email',
                    icon: Icons.alternate_email_rounded,
                    controller: emailController,
                  ),
                  AppTextFormField(
                    isLimited: true,
                    validator: (value) => controller.mobileValidate(value),
                    hint: 'Phone number',
                    icon: Icons.phone_android_rounded,
                    controller: phoneNumberController,
                  ),
                  AppTextFormField(
                    isLimited: false,
                    validator: (value) => controller.passwordValidate(
                      value,
                      confirmPWController.text,
                    ),
                    hint: 'Password',
                    icon: Icons.lock_rounded,
                    controller: passwordController,
                    obscureText: true,
                  ),
                  AppTextFormField(
                    isLimited: false,
                    validator: (value) => controller.passwordValidate(
                      value,
                      passwordController.text,
                    ),
                    hint: 'Re-enter password',
                    icon: Icons.lock_rounded,
                    controller: confirmPWController,
                    obscureText: true,
                  ),
                  AppFilledButton(
                    text: 'Sign Up',
                    color: tertiaryColor,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        verifyController.phoneNumber.value =
                            '+63${phoneNumberController.text.trim()}';
                        verifyController.verifyPhoneNumber();
                        Get.toNamed(verifyCode);

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
