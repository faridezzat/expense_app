import 'package:expense_app/transaction.dart';
import 'package:expense_app/txCard.dart';
import 'package:flutter/material.dart';

class TXS extends StatelessWidget {
  List<Transaction> transactions;
  Function deleteTx;
  TXS(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'No Transations Added yet !',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Center(
                    child: Container(
                      // alignment: Alignment.center,
                      height: constraints.maxHeight * .7,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TXCard(transactions.elementAt(index), deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}
