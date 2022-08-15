import 'package:expense_app/txCard.dart';
import 'package:flutter/material.dart';
import './transaction.dart';

class HomePage extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense App"),
        elevation: 5,
      ),
      drawer: Drawer(
        elevation: 5,
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Text("Transactions"),
            ),
          ),
          Column(
            children: transactions.map((e) {
              return TXCard(e);
            }).toList(),
          )
        ],
      ),
    );
  }
}
