import 'package:flutter/material.dart';
import 'package:kana_flutter/widgets/alphabet_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kana writing practice',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: AlphabetWidget(),
    );
  }
}
