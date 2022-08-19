import 'package:expense_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TXCard extends StatelessWidget {
  Transaction transaction;

  TXCard(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Row(children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  style: BorderStyle.solid,
                  color: Theme.of(context).primaryColor,
                )),
            width: 60,
            child: Text(
              '\$ ${transaction.amount}',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                DateFormat('yyyy-MM-dd').format(transaction.date),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
