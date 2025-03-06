import 'package:flutter/material.dart';
import 'package:moneymonitor/utils/transactions.dart';

class RecentTransactions extends StatelessWidget {
  final List<Transaction> transactions;

  const RecentTransactions({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return ListTile(
          title: Text(tx.category),
          subtitle: Text(tx.timeStamp.toString()),
          trailing: Text(tx.isIncome ? '+\$${tx.amount}' : '-\$${tx.amount}', style: TextStyle(color: tx.isIncome ? Colors.green : Colors.red)),
        );
      }).toList(),
    );
  }
}