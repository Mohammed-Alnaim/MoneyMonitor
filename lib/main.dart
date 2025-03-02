import 'package:flutter/material.dart';

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

  // hard idea::::::
  // see the possibilty of adding an api for different bank accounts such as alrajhi so that the data can be logged automatically


class MoneyMonitorApp extends StatefulWidget {
  @override
  _MoneyMonitorAppState createState() => _MoneyMonitorAppState();
}

class _MoneyMonitorAppState extends State<MoneyMonitorApp> {
  final List<Map<String, dynamic>> spendingOptions = [
    {"icon": Icons.fastfood, "label": "Food & Dining"},
    {"icon": Icons.shopping_cart, "label": "Shopping"},
    {"icon": Icons.directions_car, "label": "Transportation"},
    {"icon": Icons.receipt, "label": "Bills"},
    {"icon": Icons.movie, "label": "Entertainment"},
    {"icon": Icons.health_and_safety, "label": "Healthcare"},
    {"icon": Icons.school, "label": "Education"},
    {"icon": Icons.more_horiz, "label": "Other"},
  ];
  final List<String> currencies = ["SAR", "USD", "EUR", "TRY", "Other"];

  List<String> selectedSpentTypes = [];
  String? selectedCurrency = "";
  TextEditingController amountController = TextEditingController();

  void handleSubmit() {
    final data = {
      'spentType': selectedSpentTypes,
      'amount': amountController.text,
      'currency': selectedCurrency,
    };
    print(data);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transaction submitted successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Track Expense'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Transaction',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Expense Category',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: spendingOptions.map((option) {
                            final isSelected = selectedSpentTypes.contains(option['label']);
                            return ChoiceChip(
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(option['icon'], size: 16, color: isSelected ? Colors.white : Colors.grey),
                                  SizedBox(width: 4),
                                  Text(option['label']),
                                ],
                              ),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    selectedSpentTypes.add(option['label']);
                                  } else {
                                    selectedSpentTypes.remove(option['label']);
                                  }
                                });
                              },
                              selectedColor: Colors.deepPurple,
                              backgroundColor: Colors.grey[200],
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Amount',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.attach_money),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: '0.00',
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Currency',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: selectedCurrency,
                          onChanged: (value) {
                            setState(() {
                              selectedCurrency = value;
                            });
                          },
                          items: currencies.map((currency) {
                            return DropdownMenuItem(
                              value: currency,
                              child: Text(currency),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: handleSubmit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text('Save Transaction'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ListTile(
                  leading: Icon(Icons.fastfood, color: Colors.deepPurple),
                  title: Text('Lunch'),
                  trailing: Text('-\$12.50', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.deepPurple),
                  title: Text('Groceries'),
                  trailing: Text('-\$45.20', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
void main() {
runApp(MoneyMonitorApp());
}