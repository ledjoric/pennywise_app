import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pennywise_app/app/global/widgets/amount_textformfield.dart';
import 'package:pennywise_app/app/global/widgets/app_bottomsheet.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';

import '../../global/constants/colors.dart';
import '../../global/constants/styles.dart';
import '../../global/widgets/app_headertext.dart';

class SMAmountView extends StatefulWidget {
  const SMAmountView({super.key});

  @override
  State<SMAmountView> createState() => _SMAmountViewState();
}

class _SMAmountViewState extends State<SMAmountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppHeaderText(
          text: 'send money',
          style: kBoldHeaderStyle,
        ),
        backgroundColor: transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeaderText(
              text: 'select amount',
            ),
            IntrinsicWidth(
              child: AmountTextFormField(),
            ),
            AppFilledButton(
              text: 'Continue',
              color: tertiaryColor,
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: kBottomSheetRadius,
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return AppBottomSheet();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
