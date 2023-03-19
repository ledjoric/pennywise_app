import 'package:get/get.dart';
import 'package:pennywise_app/app/global/global_controller.dart/user_controller.dart';
import 'package:pennywise_app/app/models/transaction_history_data.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class DashboardController extends GetxController {
  var transactionsList = <Transactions>[].obs;
  var isLoading = false.obs;

  var userController = Get.put(UserController());

  // @override
  // void onInit() {
  //   // getTransaction();
  //   super.onInit();
  // }

  void getTransaction() {
    isLoading.value = true;
    userController.getUserData().then((value) {
      DioRequest.getTransactions(userController.userData.id).then((value) {
        transactionsList.value = value;
        isLoading.value = false;
      });
    });
  }
}
