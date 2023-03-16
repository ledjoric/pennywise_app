import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/widgets/transaction_card.dart';
import 'package:pennywise_app/app/models/transaction_history_data.dart';

class TransactionsBuilder extends StatelessWidget {
  // final Widget listChild;
  final Axis? scrollDirection;
  final double? childAspectRatio;
  final ScrollPhysics? physics;
  final RxList<Transactions> transactions;
  const TransactionsBuilder({
    super.key,
    // required this.listChild,
    this.scrollDirection,
    this.childAspectRatio,
    this.physics,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => transactions.isEmpty
        ? const SizedBox(
            height: 100,
            child: Center(child: Text('NO TRANSACTION PA WALA KA ATA PERA')))
        : GridView.builder(
            shrinkWrap: true,
            physics: physics,
            scrollDirection: scrollDirection ?? Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              // mainAxisSpacing: 1,
              childAspectRatio: childAspectRatio ?? 1,
            ),
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, int index) {
              return TransactionCard(
                  type: 'type',
                  date: transactions[index].transactionDate,
                  amount: transactions[index].amount.toString());
            },
          ));
  }
}
