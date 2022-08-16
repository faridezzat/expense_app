import 'package:expense_app/chart.dart';
import 'package:expense_app/newtex.dart';
import 'package:expense_app/txCard.dart';
import 'package:expense_app/txs.dart';
import 'package:flutter/material.dart';
import './transaction.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void startAddTX(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTX(addTransaction, transactions);
        });
  }

  void addTransaction(String title, double amount) {
    setState(() {
      this.transactions.add(Transaction(
          id: this.transactions.last.id + 1,
          title: title,
          date: DateTime.now(),
          amount: amount));
    });
    Navigator.of(context).pop();
  }

  var transactions = [
    Transaction(title: " Title 1", date: DateTime.now(), amount: 50, id: 1),
    Transaction(title: " Title 2", date: DateTime.now(), amount: 60, id: 2),
    Transaction(title: " Title 3", date: DateTime.now(), amount: 70, id: 3),
    Transaction(title: " Title 4", date: DateTime.now(), amount: 80, id: 4),
    Transaction(title: " Title 5", date: DateTime.now(), amount: 90, id: 5),
    Transaction(title: " Title 6", date: DateTime.now(), amount: 100, id: 6),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddTX(context),
        child: Icon(Icons.whatsapp_sharp),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove),
          ),
        ],
        title: Text("Expense App"),
        elevation: 5,
      ),
      body: Column(
        children: [
          Chart(),
          //  NewTX(addTransaction, transactions),
          TXS(transactions),
        ],
      ),
    );
  }
}
