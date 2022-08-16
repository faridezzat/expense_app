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
      ),
    );
  }
}
