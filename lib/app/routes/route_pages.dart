import 'package:get/get.dart';
import 'package:pennywise_app/app/modules/dashboard/dashboard_view.dart';
import 'package:pennywise_app/app/modules/login/login_view.dart';
import 'package:pennywise_app/app/modules/send_money/send_money_view.dart';
import 'package:pennywise_app/app/modules/sign_up/sign_up_view.dart';
import 'package:pennywise_app/app/routes/route_names.dart';

import '../modules/verify_code/verify_view.dart';

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
    GetPage(
      name: verifyCode,
      page: () => const VerifyView(),
    ),
    GetPage(
      name: dashBoard,
      page: () => const DashboardView(),
    ),
    GetPage(
      name: sendMoney,
      page: () => const SendMoneyView(),
    )
  ];
}
