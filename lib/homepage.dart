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

  void deleteTX(int id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }

  void addTransaction(String title, double amount, DateTime date) {
    setState(() {
      this.transactions.add(Transaction(
          id: transactions.isEmpty ? 1 : this.transactions.last.id + 1,
          title: title,
          date: date,
          amount: amount));
    });
    Navigator.of(context).pop();
  }

  List<Transaction> transactions = [];

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
          Chart(transactions),
          //  NewTX(addTransaction, transactions),
          TXS(
            transactions,
            deleteTX,
          ),
        ],
      ),
    );
  }
}
