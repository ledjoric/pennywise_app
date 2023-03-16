class TransactionHistoryData {
  List<Transactions>? transactions;

  TransactionHistoryData({this.transactions});

  TransactionHistoryData.fromJson(Map<String, dynamic> json) {
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (transactions != null) {
      data['transactions'] = transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? referenceNo;
  int? sender;
  int? receiver;
  int? amount;
  String? transactionDate;

  Transactions(
      {this.referenceNo,
      this.sender,
      this.receiver,
      this.amount,
      this.transactionDate});

  Transactions.fromJson(Map<String, dynamic> json) {
    referenceNo = json['reference_no'];
    sender = json['sender'];
    receiver = json['receiver'];
    amount = json['amount'];
    transactionDate = json['transaction_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reference_no'] = referenceNo;
    data['sender'] = sender;
    data['receiver'] = receiver;
    data['amount'] = amount;
    data['transaction_date'] = transactionDate;
    return data;
  }
}
