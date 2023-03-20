import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pennywise_app/app/global/widgets/amount_textformfield.dart';
import 'package:pennywise_app/app/global/widgets/cashin_bottomsheet.dart';
import 'package:pennywise_app/app/modules/cash_in/cash_in_controller.dart';

import '../../global/constants/colors.dart';
import '../../global/constants/styles.dart';
import '../../global/widgets/app_filledbutton.dart';
import '../../global/widgets/app_headertext.dart';

class CashInView extends StatefulWidget {
  const CashInView({super.key});

  @override
  State<CashInView> createState() => _CashInViewState();
}

class _CashInViewState extends State<CashInView> {
  final _formkey = GlobalKey<FormState>();

  final _controller = Get.put(CashInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppHeaderText(
          text: 'cash in',
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
                    _controller.confirmTransfer(context);
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
