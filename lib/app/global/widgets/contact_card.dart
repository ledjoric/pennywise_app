import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';

import '../constants/dimensions.dart';
import '../constants/styles.dart';

class ContactCard extends StatelessWidget {
  final void Function()? onTap;
  final String name;
  final String mobile;
  const ContactCard({
    Key? key,
    required this.onTap,
    required this.name,
    required this.mobile,
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
      title: AppRegularText(
        text: name,
        color: tertiaryColor,
        style: kBoldTextStyle,
      ),
      subtitle: AppRegularText(
        text: '+63${mobile.trim()}',
        color: greyDark,
      ),
    );
  }
}
