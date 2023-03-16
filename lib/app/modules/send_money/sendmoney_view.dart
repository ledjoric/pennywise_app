import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';
import 'package:pennywise_app/app/global/widgets/builders/connections_builder.dart';
import 'package:pennywise_app/app/global/widgets/builders/transactions_builder.dart';
import 'package:pennywise_app/app/global/widgets/contact_bubble.dart';
import 'package:pennywise_app/app/global/widgets/contact_card.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';
import 'package:pennywise_app/app/modules/send_money/sendmoney_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';

import '../../global/constants/colors.dart';
import '../../global/constants/styles.dart';
import '../../global/widgets/app_headertext.dart';

class SendMoneyView extends StatefulWidget {
  const SendMoneyView({super.key});

  @override
  State<SendMoneyView> createState() => _SendMoneyViewState();
}

class _SendMoneyViewState extends State<SendMoneyView> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(SendMoneyController());
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RedBox(),
                  const SizedBox(height: 40),
                  const AppHeaderText(
                    text: 'select a recipient',
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    hint: 'Find a contact...',
                    icon: Icons.phone_android_rounded,
                    controller: searchController,
                    validator: (value) => null,
                    isLimited: false,
                  ),
                  const SizedBox(height: 40),
                  const AppHeaderText(text: 'recent connections'),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 100,
                    child: ConnectionsBuilder(
                      listChild: ContactBubble(color: tertiaryColor),
                      scrollDirection: Axis.horizontal,
                      childAspectRatio: 1.25,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: AppHeaderText(text: 'contacts list'),
                ),
                const SizedBox(height: 10),
                ConnectionsBuilder(
                  listChild: ContactCard(
                    onTap: () {
                      Get.toNamed(sendMoneyAmount);
                    },
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 5.5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
