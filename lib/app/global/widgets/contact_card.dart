import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';

import '../constants/styles.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundColor: tertiaryColor,
        radius: 32,
      ),
      title: AppRegularText(
        text: 'Jesse Ponkman',
        color: tertiaryColor,
        style: kBoldTextStyle,
      ),
      subtitle: AppRegularText(
        text: '+63 918 247 5821',
        color: greyDark,
      ),
    );
  }
}
