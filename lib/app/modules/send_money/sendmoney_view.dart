import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';
import 'package:pennywise_app/app/global/widgets/builders/gridview_builder.dart';
import 'package:pennywise_app/app/global/widgets/contact_bubble.dart';
import 'package:pennywise_app/app/global/widgets/contact_card.dart';

import '../../global/constants/colors.dart';
import '../../global/constants/styles.dart';
import '../../global/widgets/app_headertext.dart';
import '../../global/widgets/transaction_card.dart';

class SendMoneyView extends StatefulWidget {
  const SendMoneyView({super.key});

  @override
  State<SendMoneyView> createState() => _SendMoneyViewState();
}

class _SendMoneyViewState extends State<SendMoneyView> {
  final searchController = TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeaderText(
              text: 'select a recipient',
            ),
            AppTextFormField(
              hint: 'Find a contact...',
              icon: Icons.phone_android_rounded,
              controller: searchController,
              validator: (value) => null,
              isLimited: false,
            ),
            const AppHeaderText(text: 'quick contacts'),
            const SizedBox(
              height: 100,
              child: GridViewBuilder(
                listChild: ContactBubble(color: tertiaryColor),
                scrollDirection: Axis.horizontal,
                childAspectRatio: 1.25,
              ),
            ),
            const AppHeaderText(text: 'contacts list'),
            const GridViewBuilder(
              listChild: ContactCard(),
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 5.5,
            ),
          ],
        ),
      ),
    );
  }
}
