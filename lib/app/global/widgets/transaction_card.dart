import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';

import '../constants/styles.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
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
        text: 'Parent',
        color: tertiaryColor,
      ),
      subtitle: AppRegularText(
        text: '16 Feb',
        color: greyDark,
      ),
      trailing: AppRegularText(
        text: '-\$950.00',
        color: tertiaryColor,
      ),
    );
  }
}
