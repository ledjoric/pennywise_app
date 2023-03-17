import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/profile_icon.dart';

import '../../global/constants/colors.dart';
import '../../global/constants/styles.dart';
import '../../global/widgets/app_headertext.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
              const AppHeaderText(
                text: 'Walter White',
                style: kBoldHeaderStyle,
              ),
              const SizedBox(height: 60),
              const AppHeaderText(
                text: '@walterwhite',
              ),
              const SizedBox(height: 30),
              const AppHeaderText(
                text: '+63 918 920 4585',
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
