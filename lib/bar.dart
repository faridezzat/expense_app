import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Bar extends StatelessWidget {
  Map<String, Object> data;
  double total;
  Bar({@required this.data, @required this.total});
  @override
  Widget build(BuildContext context) {
    double amount = data['amount'];
    double fraction = (total == 0) ? 0 : amount / total;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Expanded(
          child: Column(
            children: [
              Container(
                  height: constraints.maxHeight * .15,
                  child: FittedBox(
                    child: Text(
                      '\$${data['amount']}',
                    ),
                  )),
              SizedBox(
                height: constraints.maxHeight * .05,
              ),
              Container(
                height: constraints.maxHeight * .60,
                width: 10,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: fraction,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: constraints.maxHeight * .05,
              ),
              Container(
                height: constraints.maxHeight * .15,
                child: Text(data['day'] as String),
              ),
            ],
          ),
        );
      },
    );
  }
}
