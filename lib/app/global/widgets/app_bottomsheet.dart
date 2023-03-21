import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/bottomsheet_users.dart';
import 'package:pennywise_app/app/routes/route_names.dart';

class AppBottomSheet extends StatelessWidget {
  final String senderName;
  final String receiverName;
  final String senderMobile;
  final String receiverMobile;
  final String amount;
  final void Function() onPressed;
  const AppBottomSheet({
    Key? key,
    required this.onPressed,
    required this.amount,
    required this.senderName,
    required this.receiverName,
    required this.senderMobile,
    required this.receiverMobile,
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
            const AppHeaderText(
              text: 'confirm transfer?',
              style: kSmallHeaderStyle,
            ),
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
            TransactionUsers(
              sender: senderName,
              senderMobile: senderMobile,
              receiver: receiverName,
              receiverMobile: receiverMobile,
            ),
            const SizedBox(height: 60),
            AppFilledButton(
              text: 'Send Money',
              color: tertiaryColor,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
