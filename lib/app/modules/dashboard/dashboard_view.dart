import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/appbar.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';
import 'package:pennywise_app/app/global/widgets/quick_contacts.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RedBox(),
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
          const QuickContacts(),
          const AppHeaderText(text: 'transactions'),

          //make a listviewbuilder for this one
          TransactionCard(),
          TransactionCard(),
          TransactionCard(),
        ],
      ),
    );
  }
}
