import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/builders/gridview_builder.dart';
import 'package:pennywise_app/app/global/widgets/contact_bubble.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';
import 'package:pennywise_app/app/global/widgets/transaction_card.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //subject to change, make a separate dart file for appbar
      appBar: AppBar(
        title: const AppHeaderText(
          text: 'dashboard',
          style: kBoldHeaderStyle,
        ),
        backgroundColor: transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RedBox(),
            const AppRegularText(
              text: 'Your wallet balance is',
              color: secondaryColor,
            ),
            const AppHeaderText(
              text: '\$32,290.75',
              style: kBalanceStyle,
            ),
            AppFilledButton(
              text: 'Send Money',
              color: tertiaryColor,
              onPressed: () {},
            ),
            AppFilledButton(
              text: 'Cash In',
              color: transparent,
              onPressed: () {},
              style: kButtonStyle2,
              outline: kOutlinedButton,
            ),
            const AppHeaderText(text: 'quick contacts'),
            //replace with listviewbuilder
            const SizedBox(
              height: 100,
              child: GridViewBuilder(
                listChild: ContactBubble(color: tertiaryColor),
                scrollDirection: Axis.horizontal,
                childAspectRatio: 1.25,
              ),
            ),
            const AppHeaderText(text: 'transactions'),

            //make a listviewbuilder for this one
            const GridViewBuilder(
              listChild: TransactionCard(),
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 5.5,
            ),
          ],
        ),
      ),
    );
  }
}