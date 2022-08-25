import 'package:expense_app/bar.dart';
import 'package:expense_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transaction> transactions;

  Chart(this.transactions);

  double get totals {
    double x = 0;
    for (var i = 0; i < transactions.length; i++) {
      x += transactions[i].amount;
    }
    return x;
  }

  List<Map<String, Object>> get data {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var sumAmount = 0.0;

      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekDay.day &&
            transactions[i].date.month == weekDay.month &&
            transactions[i].date.year == weekDay.year) {
          sumAmount += transactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format((weekDay)), 'amount': sumAmount};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: data.map((e) {
              return Bar(
                data: e,
                total: totals,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
