import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';

import '../constants/dimensions.dart';
import '../constants/styles.dart';

class ContactCard extends StatelessWidget {
  final void Function()? onTap;
  const ContactCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 20,
      ),
      onTap: onTap,
      leading: const CircleAvatar(
        backgroundColor: tertiaryColor,
        radius: 32,
      ),
      title: const AppRegularText(
        text: 'Jesse Ponkman',
        color: tertiaryColor,
        style: kBoldTextStyle,
      ),
      subtitle: const AppRegularText(
        text: '+63 918 247 5821',
        color: greyDark,
      ),
    );
  }
}
