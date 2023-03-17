import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 116,
      backgroundColor: tertiaryColor,
      child: CircleAvatar(
        radius: 110,
        backgroundColor: primaryColor,
        child: CircleAvatar(
          radius: 104,
          backgroundColor: tertiaryColor,
        ),
      ),
    );
  }
}
