import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';
import 'package:pennywise_app/app/global/widgets/builders/connections_builder.dart';
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
  final _controller = Get.put(SendMoneyController());

  @override
  Widget build(BuildContext context) {
    Future<String?> getStringValue() async {
      // This function returns a Future<String?>
      return "Hello World";
    }

    Future<String?> _asyncValidator(String? value) async {
      String? stringValue =
          await getStringValue(); // Use `await` to get the value from the future
      String plainString = stringValue ?? ''; // Convert the String? to a String
      if (value == null || value.isEmpty) {
        return "Please enter a value";
      } else if (value != plainString) {
        return "The entered value is incorrect";
      }
      return null; // Return null if the value is valid
    }

    //
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
                    text: 'recipient\'s number',
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    onChanged: (value) => _controller.recipientExist(value),
                    autovalidateMode: AutovalidateMode.always,
                    hint: 'Enter recipient\'s number...',
                    icon: Icons.phone_android_rounded,
                    controller: searchController,
                    validator: (value) => _controller.recipientValidate(value),
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
