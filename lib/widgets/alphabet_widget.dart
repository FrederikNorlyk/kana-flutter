import 'package:flutter/material.dart';
import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/widgets/study_mode_widget.dart';

class AlphabetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isWider = size.width > size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Kana writing practice'), centerTitle: true),
      body: Flex(
        direction: isWider ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildButtons(context),
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    List<Widget> result = [];
    
    final alphabets = [
      Alphabet.hiragana,
      Alphabet.katakana
    ];

    for (var alphabet in alphabets) {
      result.add(Expanded(
          flex: 1,
          child: Stack(children: [
            SizedBox.expand(child: Image(fit: BoxFit.cover, image: AssetImage("resources/graphics/" + alphabet.image), width: double.infinity)),
            SizedBox.expand(child: TextButton(
              child: Text(alphabet.name, style: TextStyle(color: Colors.white, fontSize: 50)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudyModeWidget(alphabet)),
                );
              },
            ))
          ])
      ));
    }
    
    return result;
  }
}
