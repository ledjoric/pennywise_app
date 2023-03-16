import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';

import '../constants/styles.dart';

class TransactionCard extends StatelessWidget {
  final String? type;
  final String? date;
  final String? amount;
  const TransactionCard({
    Key? key,
    required this.type,
    required this.date,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AppRegularText(
        text: type!,
        color: tertiaryColor,
        style: kBoldTextStyle,
      ),
      subtitle: AppRegularText(
        text: date!,
        color: greyDark,
      ),
      trailing: AppRegularText(
        text: '-\$$amount',
        color: tertiaryColor,
      ),
    );
  }
}
