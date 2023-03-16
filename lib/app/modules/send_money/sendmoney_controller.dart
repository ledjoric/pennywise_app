import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/app_bottomsheet.dart';
import 'package:pennywise_app/app/models/transfer_data.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class SendMoneyController extends GetxController {
  var amount = 0;
  var receiver = '';

  final amountController = TextEditingController();

  void viewTransactionSummary(BuildContext context) {
    if (amountController.text.isNotEmpty) {
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: kBottomSheetRadius,
        ),
        context: context,
        builder: (context) {
          return AppBottomSheet(
            amount: amountController.text,
            onTap: () => sendMoney(
              1,
              TransferData(
                receiver: '9223456798',
                amount: int.parse(amountController.text),
              ),
            ),
          );
        },
      );
    } else {
      Get.snackbar(
        'Amount Required',
        'Please enter the amount to be transferred.',
        colorText: secondaryColor,
        backgroundColor: Colors.grey[300],
        // leftBarIndicatorColor: tertiaryColor,
        duration: const Duration(seconds: 2),
        borderRadius: 20,
      );
    }
  }

  void sendMoney(int userId, TransferData data) {
    DioRequest.transfer(userId, data).then((value) {
      if (value) {
        Get.snackbar(
          'NA-TRANSFER NA!!!',
          'AWTS BAWAS NA PERA MO.',
          colorText: secondaryColor,
          backgroundColor: Colors.grey[300],
          // leftBarIndicatorColor: tertiaryColor,
          duration: const Duration(seconds: 2),
          borderRadius: 20,
        );
      } else {
        print('TRANSFER FAILED');
      }
    });
  }
}
