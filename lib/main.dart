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
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(
          color: const Color(0xFF424242),
          foregroundColor: Colors.white
        )
      ),
      home: AlphabetWidget(),
    );
  }
}
