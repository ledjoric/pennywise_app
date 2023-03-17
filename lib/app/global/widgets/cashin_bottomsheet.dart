import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
import 'app_filledbutton.dart';
import 'app_headertext.dart';
import 'app_regulartext.dart';

class CashInBottomSheet extends StatelessWidget {
  const CashInBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
            const AppHeaderText(
              //add actual amount
              text: '\$amount',
              style: kBoldHeaderStyle,
            ),
            const SizedBox(height: 60),
            AppFilledButton(
              text: 'Cash In',
              color: tertiaryColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: kRadius,
                    ),
                    content: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.check_circle_outline_rounded,
                            size: 80,
                            color: tertiaryColor,
                          ),
                          SizedBox(height: 20),
                          AppHeaderText(text: 'Success!'),
                          SizedBox(height: 20),
                          AppRegularText(
                            text: 'Cash-in transaction completed.',
                            color: secondaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
