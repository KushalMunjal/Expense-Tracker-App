class ExpenseData {
  double amount;
  String category;
  String paymentType;
  String timestamp;

  ExpenseData({
    required this.amount,
    required this.category,
    required this.paymentType,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'category': category,
      'paymentType': paymentType,
      'timestamp': timestamp,
    };
  }

  factory ExpenseData.fromMap(Map<String, dynamic> map) {
    return ExpenseData(
      amount: map['amount'],
      category: map['category'],
      paymentType: map['paymentType'],
      timestamp: map['timestamp'],
    );
  }
}
