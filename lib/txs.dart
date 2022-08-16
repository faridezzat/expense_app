import 'package:expense_app/transaction.dart';
import 'package:expense_app/txCard.dart';
import 'package:flutter/material.dart';

class TXS extends StatelessWidget {
  List<Transaction> transactions;
  TXS(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TXCard(transactions.elementAt(index));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
