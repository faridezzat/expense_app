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
  bool _showChart = false;
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

  List<Transaction> transactions = [
    Transaction(id: 1, title: "One", date: DateTime.now(), amount: 100),
    Transaction(id: 2, title: "two", date: DateTime.now(), amount: 100),
    Transaction(id: 3, title: "three", date: DateTime.now(), amount: 100),
    Transaction(id: 4, title: "four", date: DateTime.now(), amount: 100),
    Transaction(id: 5, title: "five", date: DateTime.now(), amount: 100),
    Transaction(id: 6, title: "sex", date: DateTime.now(), amount: 100),
    Transaction(id: 7, title: "seven", date: DateTime.now(), amount: 100),
    Transaction(id: 8, title: "eight", date: DateTime.now(), amount: 100),
    Transaction(id: 9, title: "night", date: DateTime.now(), amount: 100),
    Transaction(id: 10, title: "ten", date: DateTime.now(), amount: 100),
    Transaction(id: 11, title: "eleven", date: DateTime.now(), amount: 100),
    Transaction(id: 12, title: "twilve", date: DateTime.now(), amount: 100),
    Transaction(id: 13, title: "thrten", date: DateTime.now(), amount: 100),
    Transaction(id: 14, title: "forten", date: DateTime.now(), amount: 100),
    Transaction(id: 15, title: "fiften", date: DateTime.now(), amount: 100),
    Transaction(id: 16, title: "sexten", date: DateTime.now(), amount: 100),
    Transaction(id: 17, title: "seventen", date: DateTime.now(), amount: 100),
    Transaction(id: 18, title: "eithen", date: DateTime.now(), amount: 100),
  ];

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appbar = AppBar(
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
    );
    final txList = Container(
      height: isLandScape
          ? (MediaQuery.of(context).size.height -
                  appbar.preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  20) *
              .75
          : (MediaQuery.of(context).size.height -
                  appbar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
              .75,
      child: TXS(
        transactions,
        deleteTX,
      ),
    );
    var swtch = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          child: Text("Show Chart"),
        ),
        Switch(
          value: _showChart,
          onChanged: (val) {
            setState(() {
              _showChart = val;
            });
          },
        ),
      ],
    );
    var shart = Container(
      height: (MediaQuery.of(context).size.height -
              appbar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          .25,
      child: Chart(transactions),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddTX(context),
        child: Icon(Icons.whatsapp_sharp),
      ),
      appBar: appbar,
      body: Column(
        children: [
          if (isLandScape) swtch,
          if (isLandScape) _showChart ? shart : txList,
          if (!isLandScape) shart,
          if (!isLandScape) txList,
        ],
      ),
    );
  }
}
