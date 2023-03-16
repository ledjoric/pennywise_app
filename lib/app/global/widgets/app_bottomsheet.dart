import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/builders/gridview_builder.dart';
import 'package:pennywise_app/app/global/widgets/contact_card.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';

class AppBottomSheet extends StatelessWidget {
  final String amount;
  final Function onTap;
  const AppBottomSheet({
    Key? key,
    required this.onTap,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: kBottomSheetRadius,
        color: primaryColor,
      ),
      height: 600,
      child: Column(
        children: [
          const RedBox(),
          const AppHeaderText(text: 'confirm transfer?'),
          AppHeaderText(
            text: '\$$amount',
            style: kBoldHeaderStyle,
          ),
          GridViewBuilder(
            listChild: ContactCard(
              onTap: () {},
            ),
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 6,
          ),
          AppFilledButton(
            text: 'Send Money',
            color: tertiaryColor,
            onPressed: () {
              onTap();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
