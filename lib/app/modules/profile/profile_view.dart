import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/profile_icon.dart';
import 'package:pennywise_app/app/modules/profile/profile_controller.dart';

import '../../global/constants/colors.dart';
import '../../global/constants/styles.dart';
import '../../global/widgets/app_headertext.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppHeaderText(
          text: 'profile',
          style: kBoldHeaderStyle,
        ),
        backgroundColor: transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const ProfileIcon(),
              const SizedBox(height: 40),
              const AppHeaderText(
                text: 'Good day,',
              ),
              AppHeaderText(
                text:
                    '${_controller.userController.userData.firstName} ${_controller.userController.userData.lastName}',
                style: kBoldHeaderStyle,
              ),
              const SizedBox(height: 60),
              AppHeaderText(
                text: _controller.userController.userData.email!,
              ),
              const SizedBox(height: 30),
              AppHeaderText(
                text: '+63${_controller.userController.userData.mobile}',
              ),
              const SizedBox(height: 100),
              AppFilledButton(
                text: 'Edit Profile',
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
