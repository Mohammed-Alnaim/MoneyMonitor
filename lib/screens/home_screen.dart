// main screen which contains adding a new transaction at the top 
// after "add the transaction" there is a list of last transactions (the ability to filter them is in a seperate screen)
// the transactions are displayed in a card with the amount, the currency, the spent type, and the date
// the spent type is displayed as an icon and a label
// the currency is displayed as a label


import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Welcome to Money Monitor!'),
      ),
    );
  }
}