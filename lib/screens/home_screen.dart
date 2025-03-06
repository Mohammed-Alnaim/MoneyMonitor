// main screen which contains adding a new transaction at the top 
// after "add the transaction" there is a list of last transactions (the ability to filter them is in a seperate screen)
// the transactions are displayed in a card with the amount, the currency, the spent type, and the date
// the spent type is displayed as an icon and a label
// the currency is displayed as a label


import 'package:flutter/material.dart';
import 'package:moneymonitor/utils/transactions.dart';
import '../widgets/add_transaction_form.dart';
import '../widgets/balance_overview_card.dart';
import '../widgets/recent_transactions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> _transactions = [];

  void _addTransaction(String title, double amount, bool isIncome) {
    setState(() {
      _transactions.add(Transaction(name: title, amount: amount, timeStamp: DateTime.now(), isIncome: isIncome, category: 'General', currency: 'usd'));
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalIncome = _transactions.where((tx) => tx.isIncome).fold(0.0, (sum, item) => sum + item.amount);
    double totalExpenses = _transactions.where((tx) => !tx.isIncome).fold(0.0, (sum, item) => sum + item.amount);
    double balance = totalIncome - totalExpenses;

    return Scaffold(
      appBar: AppBar(title: const Text('Money Tracker'), actions: [IconButton(icon: const Icon(Icons.menu), onPressed: () {})]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BalanceOverviewCard(balance: balance, income: totalIncome, expenses: totalExpenses),
            AddTransactionForm(onAddTransaction: _addTransaction),
            RecentTransactions(transactions: _transactions),
          ],
        ),
      ),
    );
  }
}