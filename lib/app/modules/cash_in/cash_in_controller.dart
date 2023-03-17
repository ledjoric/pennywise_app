import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/cashin_bottomsheet.dart';

class CashInController extends GetxController {
  final amountController = TextEditingController();

  void confirmTransfer(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: kBottomSheetRadius,
      ),
      context: context,
      builder: (context) => CashInBottomSheet(
        amount: amountController.text,
      ),
    );
  }
}
