import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/connections_controller.dart';
import 'package:pennywise_app/app/global/user_controller.dart';
import 'package:pennywise_app/app/global/widgets/app_textformfield.dart';
import 'package:pennywise_app/app/global/widgets/builders/connections_builder.dart';
import 'package:pennywise_app/app/global/widgets/divider.dart';
import 'package:pennywise_app/app/modules/send_money/sendmoney_controller.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

import '../../global/constants/colors.dart';
import '../../global/constants/styles.dart';
import '../../global/widgets/app_headertext.dart';

class SendMoneyView extends StatefulWidget {
  const SendMoneyView({super.key});

  @override
  State<SendMoneyView> createState() => _SendMoneyViewState();
}

class _SendMoneyViewState extends State<SendMoneyView> {
  final searchController = TextEditingController();
  final _controller = Get.put(SendMoneyController());
  final _connectionsController = Get.put(ConnectionsController());
  final userController = Get.put(UserController());

  @override
  void initState() {
    // final tasksData = Provider.of<ConnectionsProvider>(context);
    _connectionsController.isLoading.value = true;
    DioRequest.getConnections(userController.userData.id).then((value) {
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
      appBar: AppBar(
        title: const AppHeaderText(
          text: 'send money',
          style: kBoldHeaderStyle,
        ),
        backgroundColor: transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RedBox(),
                  const SizedBox(height: 40),
                  const AppHeaderText(
                    text: 'recipient\'s number',
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _controller.formKey,
                    child: AppTextFormField(
                      onChanged: (value) => _controller.recipientExist(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hint: 'Enter recipient\'s number...',
                      icon: Icons.phone_android_rounded,
                      controller: searchController,
                      validator: (value) =>
                          _controller.recipientValidate(value),
                      isLimited: false,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: AppHeaderText(text: 'connections list'),
                ),
                const SizedBox(height: 10),
                ConnectionsBuilder(
                  isLoading: _connectionsController.isLoading,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 5.5,
                  connections: _connectionsController.connectionsData,
                  connectionLength: _connectionsController.connectionsLength,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
