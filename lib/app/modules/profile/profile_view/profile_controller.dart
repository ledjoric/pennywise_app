import 'package:get/get.dart';
import 'package:pennywise_app/app/global/global_controller.dart/user_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class ProfileController extends GetxController {
  final userController = Get.put(UserController());

  @override
  void onInit() {
    userController.getUserData();
    super.onInit();
  }

  void logOut() {
    // userController.deleteUserData();
    // userController.deleteCredentials();
    // Get.offAllNamed(logIn);

    DioRequest.logout().then((value) {
      if (value) {
        userController.deleteUserData();
        userController.deleteCredentials();
        Get.offAllNamed(logIn);
      }
      return;
    });
  }
}
