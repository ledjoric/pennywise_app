import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/widgets/contact_card.dart';
import 'package:pennywise_app/app/models/transaction_history_data.dart';
import 'package:pennywise_app/app/services/dio_requests.dart';

class ConnectionsBuilder extends StatelessWidget {
  final Axis? scrollDirection;
  final double? childAspectRatio;
  final ScrollPhysics? physics;
  final dynamic connections;
  final int connectionLength;
  const ConnectionsBuilder({
    super.key,
    this.scrollDirection,
    this.childAspectRatio,
    this.physics,
    required this.connections,
    required this.connectionLength,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: physics,
      scrollDirection: scrollDirection ?? Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        // mainAxisSpacing: 1,
        childAspectRatio: childAspectRatio ?? 1,
      ),
      itemCount: connectionLength,
      itemBuilder: (BuildContext context, int index) {
        return ContactCard(
          onTap: () {
            DioRequest.getConnections(1);
          },
          name: connections[index][0]['firstName'],
          mobile: connections[index][0]['mobile'],
        );
      },
    );
  }
}
