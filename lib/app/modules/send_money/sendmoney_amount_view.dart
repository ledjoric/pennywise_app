import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/widgets/amount_textformfield.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';
import 'package:pennywise_app/app/modules/send_money/sendmoney_controller.dart';

import '../../global/constants/colors.dart';
import '../../global/constants/styles.dart';
import '../../global/widgets/app_headertext.dart';

class SMAmountView extends StatefulWidget {
  const SMAmountView({super.key});

  @override
  State<SMAmountView> createState() => _SMAmountViewState();
}

class _SMAmountViewState extends State<SMAmountView> {
  final _controller = Get.put(SendMoneyController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppHeaderText(
          text: 'send money',
          style: kBoldHeaderStyle,
        ),
        // backgroundColor: transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const AppHeaderText(
                text: 'select amount',
                style: kSmallHeaderStyle,
              ),
              const SizedBox(height: 10),
              IntrinsicWidth(
                child: Form(
                  key: _formkey,
                  child: AmountTextFormField(
                    validator: (value) => _controller.amountValidate(value),
                    controller: _controller.amountController,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppFilledButton(
                text: 'Continue',
                color: tertiaryColor,
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _controller.viewTransactionSummary(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
