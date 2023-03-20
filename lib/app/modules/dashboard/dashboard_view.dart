import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/global_controller.dart/connections_controller.dart';
import 'package:pennywise_app/app/global/global_controller.dart/user_controller.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/builders/connections_builder.dart';
import 'package:pennywise_app/app/global/widgets/builders/transactions_builder.dart';
import 'package:pennywise_app/app/modules/dashboard/dashboard_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final _controller = Get.put(DashboardController());
  final _connectionsController = Get.put(ConnectionsController());
  final _userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    _connectionsController.isLoading.value = true;

    _userController.getUserData();
    print(_userController.userData.id);
    if (_userController.userData.id != null) {
      DioRequest.getConnections(_userController.userData.id).then((value) {
        _connectionsController.connectionsLength.value = value.length;
        setState(() {
          _connectionsController.connectionsData = value;
        });
        _connectionsController.isLoading.value = false;
      });
    } else {
      _connectionsController.isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //subject to change, make a separate dart file for appbar
      appBar: AppBar(
        // backgroundColor: transparent,
        elevation: 0,
        title: const AppHeaderText(
          text: 'dashboard',
          style: kBoldHeaderStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            iconSize: 45,
            color: tertiaryColor,
            onPressed: () => Get.toNamed(profileView),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const AppRegularText(
                    text: 'Your wallet balance is',
                    color: secondaryColor,
                  ),
                  AppHeaderText(
                    text: _userController.userData.balance == null
                        ? '\$0'
                        : '\$${_userController.userData.balance.toString()}',
                    style: kBalanceStyle,
                  ),
                  const SizedBox(height: 25),
                  AppFilledButton(
                    text: 'Send Money',
                    color: tertiaryColor,
                    onPressed: () {
                      Get.toNamed(sendMoney);
                    },
                  ),
                  const SizedBox(height: 10),
                  AppFilledButton(
                    text: 'Cash In',
                    color: transparent,
                    onPressed: () => Get.toNamed(cashIn),
                    style: kButtonStyle2,
                    outline: kOutlinedButton,
                  ),
                  const SizedBox(height: 40),
                  const AppHeaderText(text: 'quick contacts'),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(
              height: 105,
              child: ConnectionsBuilder(
                isLoading: _connectionsController.isLoading,
                scrollDirection: Axis.horizontal,
                childAspectRatio: 1.25,
                connections: _connectionsController.connectionsData,
                connectionLength: _connectionsController.connectionsLength,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AppHeaderText(text: 'transactions'),
            ),
            TransactionsBuilder(
              isLoading: _controller.isLoading,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 5.5,
              transactions: _controller.transactionsList,
              userId: _userController.userData.id,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
