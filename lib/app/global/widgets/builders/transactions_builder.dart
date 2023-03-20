import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';
import 'package:pennywise_app/app/global/widgets/transaction_card.dart';
import 'package:pennywise_app/app/models/transaction_history_data.dart';

class TransactionsBuilder extends StatelessWidget {
  // final Widget listChild;
  final int? userId;
  final Axis? scrollDirection;
  final double? childAspectRatio;
  final ScrollPhysics? physics;
  final RxList<Transactions> transactions;
  final RxBool isLoading;
  const TransactionsBuilder({
    super.key,
    // required this.listChild,
    this.scrollDirection,
    this.childAspectRatio,
    this.physics,
    required this.transactions,
    required this.isLoading,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : transactions.isEmpty
              ? const SizedBox(
                  height: 100,
                  child: Center(
                    child: AppRegularText(
                      text: 'No transactions yet. Send money or cash in!',
                      color: secondaryColor,
                    ),
                  ),
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
                  itemCount: transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    final transaction = transactions[index];
                    String type;
                    String operator;

                    // SET TRANSACTION TYPE AND AMOUNT OPERATOR
                    if (transaction.sender == userId) {
                      type = 'Send Money';
                      operator = '-';
                    } else {
                      type = 'Receive Money';
                      operator = '+';
                    }

                    final date = DateFormat('MMM d, yyyy h:mm a')
                        .format(DateTime.parse(transaction.transactionDate!));

                    return TransactionCard(
                      type: type,
                      date: date,
                      amount: transaction.amount.toString(),
                      operator: operator,
                    );
                  },
                ),
    );
  }
}
