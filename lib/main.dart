import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(app());
}

//home
class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'OpenSans',
        textTheme: TextTheme(
          titleSmall: TextStyle(
            fontSize: 15,
            color: Colors.purple,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
