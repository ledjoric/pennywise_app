class TransferData {
  String? receiver;
  int? amount;

  TransferData({
    required this.receiver,
    required this.amount,
  });

  TransferData.fromJson(Map<String, dynamic> json) {
    receiver = json['receiver'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['receiver'] = receiver;
    data['amount'] = amount;
    return data;
  }
}
