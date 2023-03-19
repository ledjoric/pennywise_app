import 'package:get/get.dart';
import 'package:pennywise_app/app/global/global_controller.dart/user_controller.dart';

class ProfileController extends GetxController {
  final userController = Get.put(UserController());

  @override
  void onInit() {
    userController.getUserData();
    super.onInit();
  }
}
