class Transaction {
  final DateTime timeStamp;
  final String category;
  final double amount;
  final String currency;
  final bool isIncome;
  

  Transaction({
    required this.timeStamp,
    required this.category,
    required this.amount,
    required this.currency,
    required this.isIncome, required String name,
  });
}