import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/strings.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/global_controller.dart/user_controller.dart';
import 'package:pennywise_app/app/global/widgets/app_bottomsheet.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/models/transfer_data.dart';
import 'package:pennywise_app/app/models/user_data.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class SendMoneyController extends GetxController {
  var amount = 0;
  var receiver = 0;
  var exist = false;

  final amountController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var receiverData = UserData();

  // var connectionsData;

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
            senderName: userController.userData.firstName ?? 'ME',
            senderMobile: userController.userData.mobile ?? '9123456789',
            receiverName: receiverData.firstName ?? 'HE/SHE',
            receiverMobile: receiverData.mobile ?? '9987654321',
            amount: amountController.text,
            onPressed: () => sendMoney(
              userController.userData.id,
              TransferData(
                receiver: receiverData.mobile,
                amount: int.parse(amountController.text),
              ),
              context,
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

  void sendMoney(int? userId, TransferData data, BuildContext context) {
    DioRequest.transfer(userId, data).then((value) {
      if (value) {
        userController.fetchUserData().then((value) {
          showConfirmedDialog(context);
        });
      } else {
        print('TRANSFER FAILED');
      }
    });
  }

  void showConfirmedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: kRadius,
        ),
        content: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.check_circle_outline_rounded,
                size: 80,
                color: tertiaryColor,
              ),
              SizedBox(height: 20),
              AppHeaderText(text: 'Sent!'),
              SizedBox(height: 20),
              AppRegularText(
                text: 'Transaction successful.',
                color: secondaryColor,
              ),
            ],
          ),
        ),
      ),
    ).then(
      (value) => Get.offAllNamed(dashBoard),
    );
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
      if (formKey.currentState!.validate()) {
        Get.toNamed(sendMoneyAmount);
      }
    } else {
      exist = false;
      if (formKey.currentState!.validate()) {}
    }
  }

  void getReceiverData(dynamic receiver) {
    receiverData = UserData.fromJson(receiver);
    Get.toNamed(sendMoneyAmount);
  }
}
