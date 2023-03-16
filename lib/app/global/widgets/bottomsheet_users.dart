import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
import 'app_regulartext.dart';

class TransactionUsers extends StatelessWidget {
  final String sender;
  final String receiver;

  const TransactionUsers({
    Key? key,
    required this.sender,
    required this.receiver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(
            left: 20,
          ),
          leading: const CircleAvatar(
            backgroundColor: tertiaryColor,
            radius: 32,
          ),
          title: AppRegularText(
            text: sender,
            color: tertiaryColor,
            style: kBoldTextStyle,
          ),
          subtitle: const AppRegularText(
            text: 'Sender',
            color: greyDark,
          ),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.only(
            left: 20,
          ),
          leading: const CircleAvatar(
            backgroundColor: tertiaryColor,
            radius: 32,
          ),
          title: AppRegularText(
            text: receiver,
            color: tertiaryColor,
            style: kBoldTextStyle,
          ),
          subtitle: const AppRegularText(
            text: 'Receiver',
            color: greyDark,
          ),
        ),
      ],
    );
  }
}
