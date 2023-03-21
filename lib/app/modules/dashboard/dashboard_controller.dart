import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/global_controller.dart/connections_controller.dart';
import 'package:pennywise_app/app/global/global_controller.dart/user_controller.dart';
import 'package:pennywise_app/app/models/transaction_history_data.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class DashboardController extends GetxController {
  var transactionsList = <Transactions>[].obs;
  var isLoading = false.obs;

  final _userController = Get.put(UserController());

  @override
  void onInit() {
    getTransaction();
    super.onInit();
  }

  void getTransaction() {
    isLoading.value = true;

    _userController.getUserData();
    print(_userController.userData.id);
    if (_userController.userData.id != null) {
      DioRequest.getTransactions(_userController.userData.id).then((value) {
        transactionsList.value = value;
        isLoading.value = false;
      });
    } else {
      isLoading.value = false;
    }
  }

  void goToSendMoney() {
    if (_userController.userData.isVerified == 1) {
      Get.toNamed(sendMoney);
    } else {
      Get.snackbar(
        'Email Verification Required',
        'Please verify your email before sending money. Check your inbox or spam folder for an email from us.',
        colorText: secondaryColor,
        backgroundColor: Colors.grey[300],
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 500),
        borderRadius: 20,
      );
    }
  }
}
