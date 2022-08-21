import 'package:expense_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TXCard extends StatelessWidget {
  Transaction transaction;
  Function deleteTx;
  TXCard(
    this.transaction,
    this.deleteTx,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(5),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 3,
        ),
        leading: CircleAvatar(
            radius: 30,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                transaction.amount.toString(),
              ),
            )),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(
          DateFormat.yMd().format(transaction.date),
        ),
        trailing: IconButton(
          onPressed: () => deleteTx(
            transaction.id,
          ),
          icon: Icon(
            Icons.delete_rounded,
          ),
        ),
      ),
    );
  }
}
