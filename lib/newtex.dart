import 'package:expense_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTX extends StatefulWidget {
  List<Transaction> transactions;
  final Function addTX;

  NewTX(this.addTX, this.transactions);

  @override
  State<NewTX> createState() => _NewTXState();
}

class _NewTXState extends State<NewTX> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate;

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        Duration(
          days: 30,
        ),
      ),
      lastDate: DateTime.now().add(
        Duration(
          days: 30,
        ),
      ),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: " Expense Title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: " Expense Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectedDate == null
                      ? "No Date Selected"
                      : DateFormat.yMd().format(_selectedDate)),
                  IconButton(
                    onPressed: presentDatePicker,
                    icon: Icon(
                      Icons.calendar_month,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => widget.addTX(
                titleController.text,
                double.parse(
                  amountController.text,
                ),
                _selectedDate,
              ),
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
