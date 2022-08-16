import 'package:expense_app/transaction.dart';
import 'package:flutter/material.dart';

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
            ElevatedButton(
              onPressed: () => widget.addTX(
                titleController.text,
                double.parse(
                  amountController.text,
                ),
              ),
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
