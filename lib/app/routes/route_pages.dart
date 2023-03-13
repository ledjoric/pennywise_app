import 'package:get/get.dart';
import 'package:pennywise_app/app/modules/login/login_view.dart';
import 'package:pennywise_app/app/modules/sign_up/sign_up_view.dart';
import 'package:pennywise_app/app/routes/route_names.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: signUp,
      page: () => const SignUpView(),
    ),
    GetPage(
      name: logIn,
      page: () => const LoginView(),
    ),
  ];
}
