import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/bottomsheet_users.dart';
import 'package:pennywise_app/app/global/widgets/builders/connections_builder.dart';
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
      height: 500,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppHeaderText(text: 'confirm transfer?'),
            const SizedBox(height: 20),
            AppHeaderText(
              text: '\$$amount',
              style: kBoldHeaderStyle,
            ),
            const SizedBox(height: 20),
            //subject to be replaced
            // ConnectionsBuilder(
            //   listChild: ContactCard(
            //     onTap: () {},
            //   ),
            //   physics: const NeverScrollableScrollPhysics(),
            //   childAspectRatio: 6,
            // ),
            const TransactionUsers(
              sender: 'BEN',
              receiver: 'JUAN',
            ),
            const SizedBox(height: 60),
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
      ),
    );
  }
}
