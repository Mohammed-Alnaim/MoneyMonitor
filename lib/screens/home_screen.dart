import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/transaction_form.dart';
import '../widgets/transaction_list.dart';
import '../widgets/app_drawer.dart';
import '../utils/transactions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Monitor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Navigator.pushNamed(context, '/filtered');
            },
          ),
          IconButton(
            icon: const Icon(Icons.insights),
            onPressed: () {
              // Navigate to insights screen
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Consumer<TransactionProvider>(
        builder: (ctx, transactionProvider, _) {
          final recentTransactions = transactionProvider.recentTransactions;
          
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Card
                Card(
                  margin: const EdgeInsets.all(16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          'Total Spent',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$${transactionProvider.getTotalSpent().toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _SummaryItem(
                              title: 'Today',
                              amount: '\$45.50',
                              color: Colors.blue,
                            ),
                            _SummaryItem(
                              title: 'Week',
                              amount: '\$325.75',
                              color: Colors.orange,
                            ),
                            _SummaryItem(
                              title: 'Month',
                              amount: '\$1,250.00',
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Transaction Form
                TransactionForm(
                  onAddTransaction: (newTransaction) {
                    transactionProvider.addTransaction(newTransaction);
                  },
                ),
                
                // Recent Transactions
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                  child: Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
                TransactionList(transactions: recentTransactions),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  const _SummaryItem({
    required this.title,
    required this.amount,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}