import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';

import '../../global/constants/colors.dart';
import '../../global/constants/styles.dart';
import '../../global/widgets/app_filledbutton.dart';
import '../../global/widgets/app_headertext.dart';
import '../../global/widgets/profile_icon.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppHeaderText(
          text: 'edit profile',
          style: kBoldHeaderStyle,
        ),
        backgroundColor: transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const ProfileIcon(),
              const SizedBox(height: 40),
              AppTextFormField(
                isLimited: false,
                validator: (value) => (null),
                hint: 'First name...',
                icon: Icons.person_rounded,
                controller: firstNameController,
              ),
              const SizedBox(height: 10),
              AppTextFormField(
                isLimited: false,
                validator: (value) => (null),
                hint: 'Last name...',
                icon: Icons.person_rounded,
                controller: lastNameController,
              ),
              const SizedBox(height: 10),
              AppTextFormField(
                isLimited: false,
                validator: (value) => (null),
                hint: 'Email address...',
                icon: Icons.alternate_email_rounded,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              AppTextFormField(
                isLimited: true,
                validator: (value) => (null),
                hint: 'Phone number...',
                icon: Icons.phone_android_rounded,
                controller: phoneNumberController,
              ),
              const SizedBox(height: 40),
              AppFilledButton(
                text: 'Save Changes',
                color: tertiaryColor,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              AppFilledButton(
                text: 'Cancel',
                color: transparent,
                onPressed: () {},
                style: kButtonStyle2,
                outline: kOutlinedButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
