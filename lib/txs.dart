import 'package:expense_app/transaction.dart';
import 'package:expense_app/txCard.dart';
import 'package:flutter/material.dart';

class TXS extends StatelessWidget {
  List<Transaction> transactions;
  Function deleteTx;
  TXS(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transations Added yet !',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TXCard(transactions.elementAt(index), deleteTx);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
