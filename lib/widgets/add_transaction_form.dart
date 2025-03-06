import 'package:flutter/material.dart';

class AddTransactionForm extends StatefulWidget {
  final Function(String, double, bool) onAddTransaction;
  
  const AddTransactionForm({required this.onAddTransaction, Key? key}) : super(key: key);

  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  bool _isIncome = false;

  void _submitData() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    if (title.isEmpty || amount <= 0) return;
    widget.onAddTransaction(title, amount, _isIncome);
    _titleController.clear();
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: _titleController, decoration: const InputDecoration(labelText: 'Title')),
        TextField(controller: _amountController, decoration: const InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number),
        SwitchListTile(title: const Text('Income'), value: _isIncome, onChanged: (val) => setState(() => _isIncome = val)),
        ElevatedButton(onPressed: _submitData, child: const Text('Add Transaction')),
      ],
    );
  }
}