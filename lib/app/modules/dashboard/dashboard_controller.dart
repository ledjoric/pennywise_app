import 'package:get/get.dart';
import 'package:pennywise_app/app/global/global_controller.dart/connections_controller.dart';
import 'package:pennywise_app/app/global/global_controller.dart/user_controller.dart';
import 'package:pennywise_app/app/models/transaction_history_data.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class DashboardController extends GetxController {
  var transactionsList = <Transactions>[].obs;
  var isLoading = false.obs;

  final _userController = Get.put(UserController());
  final _connectionsController = Get.put(ConnectionsController());

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
}
