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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LogoContainer(),
                      const SizedBox(height: 20),
                      const AppHeaderText(
                        text: 'create a new',
                      ),
                      const AppHeaderText(
                        text: 'account.',
                        style: kBoldHeaderStyle,
                      ),
                      const SizedBox(height: 20),
                      const RedBox(),
                      const SizedBox(height: 60),
                      AppTextFormField(
                        isLimited: false,
                        validator: (value) =>
                            controller.textFieldValidate(value),
                        hint: 'First name...',
                        icon: Icons.person_rounded,
                        controller: firstNameController,
                      ),
                      const SizedBox(height: 20),
                      AppTextFormField(
                        isLimited: false,
                        validator: (value) =>
                            controller.textFieldValidate(value),
                        hint: 'Last name...',
                        icon: Icons.person_rounded,
                        controller: lastNameController,
                      ),
                      const SizedBox(height: 20),
                      AppTextFormField(
                        isLimited: false,
                        validator: (value) => controller.emailValidate(value),
                        hint: 'Email address...',
                        icon: Icons.alternate_email_rounded,
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),
                      AppTextFormField(
                        isLimited: true,
                        validator: (value) => controller.mobileValidate(value),
                        hint: 'Phone number...',
                        icon: Icons.phone_android_rounded,
                        controller: phoneNumberController,
                      ),
                      const SizedBox(height: 20),
                      AppTextFormField(
                        isLimited: false,
                        validator: (value) => controller.passwordValidate(
                          value,
                          confirmPWController.text,
                        ),
                        hint: 'Password...',
                        icon: Icons.lock_rounded,
                        controller: passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      AppTextFormField(
                        isLimited: false,
                        validator: (value) => controller.passwordValidate(
                          value,
                          passwordController.text,
                        ),
                        hint: 'Re-enter password...',
                        icon: Icons.lock_rounded,
                        controller: confirmPWController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppRegularText(
                            text: 'Already have an account?',
                            color: tertiaryColor,
                          ),
                          AppRegularText(
                            text: ' Sign In.',
                            color: tertiaryColor,
                            onTap: () {
                              Get.toNamed(logIn);
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
