import 'package:flutter/material.dart';
import 'package:pennywise_app/app/models/transaction_history_data.dart';

class ConnectionsBuilder extends StatelessWidget {
  final Widget listChild;
  final Axis? scrollDirection;
  final double? childAspectRatio;
  final ScrollPhysics? physics;
  final List<Transactions>? transactions;
  const ConnectionsBuilder({
    super.key,
    required this.listChild,
    this.scrollDirection,
    this.childAspectRatio,
    this.physics,
    this.transactions,
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
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return listChild;
      },
    );
  }
}
