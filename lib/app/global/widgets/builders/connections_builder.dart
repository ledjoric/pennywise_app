import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/contact_bubble.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/contact_card.dart';
import 'package:pennywise_app/app/models/transaction_history_data.dart';
import 'package:pennywise_app/app/modules/send_money/sendmoney_controller.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class ConnectionsBuilder extends StatelessWidget {
  final Axis? scrollDirection;
  final double? childAspectRatio;
  final ScrollPhysics? physics;
  final dynamic connections;
  final RxInt connectionLength;
  final RxBool isLoading;
  const ConnectionsBuilder({
    super.key,
    this.scrollDirection,
    this.childAspectRatio,
    this.physics,
    required this.connections,
    required this.connectionLength,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SendMoneyController());
    return Obx(
      () => isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : connectionLength.value == 0
              ? const Center(
                  child: Text('WALA KANG CONNECTIONS'),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: physics,
                  scrollDirection: scrollDirection ?? Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    // mainAxisSpacing: 1,
                    childAspectRatio: childAspectRatio ?? 1,
                  ),
                  itemCount: connectionLength.value,
                  itemBuilder: (BuildContext context, int index) {
                    return scrollDirection == Axis.vertical
                        ? ContactCard(
                            onTap: () => controller
                                .getReceiverData(connections[index][0]),
                            name: connections[index][0]['firstName'],
                            mobile: connections[index][0]['mobile'],
                          )
                        : ContactBubble(
                            onTap: () => controller
                                .getReceiverData(connections[index][0]),
                            color: tertiaryColor,
                            name: connections[index][0]['firstName']);
                  },
                ),
    );
  }
}
