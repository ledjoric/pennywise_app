import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/amount_textformfield.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/builders/gridview_builder.dart';
import 'package:pennywise_app/app/global/widgets/contact_card.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    Key? key,
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
          const AppHeaderText(
            text: '280.75',
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
