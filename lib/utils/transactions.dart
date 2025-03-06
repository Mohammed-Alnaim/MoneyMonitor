class Transaction {
  final DateTime timeStamp;
  final String category;
  final double amount;
  final double currency;
  

  Transaction({
    required this.timeStamp,
    required this.category,
    required this.amount,
    required this.currency,
  });
}