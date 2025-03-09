import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String category;
  final double amount;
  final String currency;
  final DateTime date;

  Transaction({
    required this.id,
    required this.category,
    required this.amount,
    required this.currency,
    required this.date,
  });
}

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions {
    return [..._transactions];
  }

  List<Transaction> get recentTransactions {
    return _transactions
        .where((tx) => tx.date.isAfter(
              DateTime.now().subtract(const Duration(days: 7)),
            ))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  double getTotalSpent() {
    // For simplicity, we're ignoring currency conversion here
    return _transactions.fold(0, (sum, tx) => sum + tx.amount);
  }

  Map<String, double> getCategoryBreakdown() {
    final Map<String, double> result = {};
    
    for (var tx in _transactions) {
      if (result.containsKey(tx.category)) {
        result[tx.category] = (result[tx.category] ?? 0) + tx.amount;
      } else {
        result[tx.category] = tx.amount;
      }
    }
    
    return result;
  }
}