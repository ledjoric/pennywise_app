import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/global_controller.dart/user_controller.dart';
import 'package:pennywise_app/app/modules/cash_in/cash_in_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
import 'app_filledbutton.dart';
import 'app_headertext.dart';
import 'app_regulartext.dart';

class CashInBottomSheet extends StatelessWidget {
  final String amount;
  const CashInBottomSheet({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(CashInController());
    var _userController = Get.put(UserController());
    return Container(
      decoration: const BoxDecoration(
        borderRadius: kBottomSheetRadius,
        color: primaryColor,
      ),
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppHeaderText(text: 'confirm transfer?'),
            const SizedBox(height: 20),
            AppHeaderText(
              //add actual amount
              text: '\$$amount',
              style: kBoldHeaderStyle,
            ),
            const SizedBox(height: 60),
            AppFilledButton(
              text: 'Cash In',
              color: tertiaryColor,
              onPressed: () {
                _controller.cashIn(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
