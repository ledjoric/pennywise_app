import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/strings.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/user_controller.dart';
import 'package:pennywise_app/app/global/widgets/app_bottomsheet.dart';
import 'package:pennywise_app/app/models/transfer_data.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class SendMoneyController extends GetxController {
  var amount = 0;
  var receiver = '';
  var exist = false;

  final amountController = TextEditingController();

  var userController = Get.put(UserController());

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
              userController.userData.id,
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

  void sendMoney(int? userId, TransferData data) {
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

  String? recipientValidate(String? value) {
    if (value == null || value.isEmpty) {
      return emptyTextFieldError;
    } else if (value.length == 10) {
      if (!exist) {
        return 'The phone number you entered is not registered with our app. Please check and try again.';
      }
    }
    return null;
  }

  void recipientExist(String? value) async {
    if (value == null || value.isEmpty || !value.isNum || value.length != 10) {
      return;
    }

    if (await DioRequest.getReceiver(
        userController.userData.id, int.parse(value))) {
      exist = true;
    } else {
      exist = false;
      // return 'The phone number you entered is not registered with our app. Please check and try again.';
    }
  }
}
