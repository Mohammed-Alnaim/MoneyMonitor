  //FEATURE IDEAS
  // display the total amount spent in the selected currency
  // create a filter to display transactions by category
  // add a feature to edit or delete a transaction
  // create a chart to display the total amount spent by category
  // filter transactions by month and year
  // submit the data to google sheets and firebase simultaneously
  // add a change the default currency option or selector(it makes the selected currency the default currency and saves this perference until the user changes it)
  // add a feature to add a note to the transaction
  // make other tabs for the filter options
  // make the process of adding a new entry as easy as possible like making all options be clicked and not typed (such as the amount(find a way to make this easy), the currency can be pre selected)
  // MAKE THE UI MODERN AND GOOD LOOKING

  // add a feature to add a new category

  // hard idea::::::
  // see the possibilty of adding an api for different bank accounts such as alrajhi so that the data can be logged automatically



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'utils/transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => TransactionProvider(),
      child: MaterialApp(
        title: 'Money Monitor',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: false,
            elevation: 0,
          ),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}