import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/connections_controller.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pennywise_app/app/global/widgets/app_filledbutton.dart';
import 'package:pennywise_app/app/global/widgets/app_headertext.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/builders/connections_builder.dart';
import 'package:pennywise_app/app/global/widgets/builders/transactions_builder.dart';
import 'package:pennywise_app/app/global/widgets/contact_bubble.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';
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

  @override
  void initState() {
    _connectionsController.isLoading.value = true;
    DioRequest.getConnections(6).then((value) {
      _connectionsController.connectionsLength.value = value.length;
      setState(() {
        _connectionsController.connectionsData = value;
      });
      _connectionsController.isLoading.value = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //subject to change, make a separate dart file for appbar
      appBar: AppBar(
        title: const AppHeaderText(
          text: 'dashboard',
          style: kBoldHeaderStyle,
        ),
        backgroundColor: transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const AppRegularText(
                text: 'Your wallet balance is',
                color: secondaryColor,
              ),
              const SizedBox(height: 20),
              AppHeaderText(
                text: _controller.userController.userData.balance == null
                    ? '\$0.00'
                    : '\$${_controller.userController.userData.balance.toString()}',
                style: kBalanceStyle,
              ),
              const SizedBox(height: 40),
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
                onPressed: () {},
                style: kButtonStyle2,
                outline: kOutlinedButton,
              ),
              const SizedBox(height: 60),
              const AppHeaderText(text: 'quick contacts'),
              //replace with listviewbuilder
              SizedBox(
                height: 100,
                child: ConnectionsBuilder(
                  isLoading: _connectionsController.isLoading,
                  scrollDirection: Axis.horizontal,
                  childAspectRatio: 1.25,
                  connections: null,
                  connectionLength: _connectionsController.connectionsLength,
                ),
              ),
              const SizedBox(height: 20),
              const AppHeaderText(text: 'transactions'),
              TransactionsBuilder(
                isLoading: _controller.isLoading,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 5.5,
                transactions: _controller.transactionsList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
