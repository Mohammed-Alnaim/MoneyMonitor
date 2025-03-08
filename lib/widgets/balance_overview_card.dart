import 'package:flutter/material.dart';

class BalanceOverviewCard extends StatelessWidget {
  final double balance;
  final double income;
  final double expenses;

  const BalanceOverviewCard({required this.balance, required this.income, required this.expenses, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('\$${balance.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Income: \$${income.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green)),
              Text('Expenses: \$${expenses.toStringAsFixed(2)}', style: const TextStyle(color: Colors.red)),
            ],
          )
        ],
      ),
    );
  }
}