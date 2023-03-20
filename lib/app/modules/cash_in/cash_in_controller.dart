import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/global_controller.dart/user_controller.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/cashin_bottomsheet.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class CashInController extends GetxController {
  final amountController = TextEditingController();
  final _userController = Get.put(UserController());

  @override
  void onInit() {
    _userController.getUserData();
    super.onInit();
  }

  void cashIn(BuildContext context) async {
    DioRequest.cashIn(
      _userController.userData.id,
      int.parse(amountController.text),
    ).then((value) {
      if (value) {
        _userController.fetchUserData().then(
              (value) => successDialog(context),
            );
      } else {
        Get.snackbar(
          'Cash In Failed',
          'There was an error processing your cash in request.',
        );
      }
    });
  }

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

  void successDialog(BuildContext context) {
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
                    AppHeaderText(text: 'Success!'),
                    SizedBox(height: 20),
                    AppRegularText(
                      text: 'Cash-in transaction completed.',
                      color: secondaryColor,
                    ),
                  ],
                ),
              ),
            )).then(
      (value) => Get.offAllNamed(dashBoard),
    );
  }
}
