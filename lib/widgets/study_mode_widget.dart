import 'package:flutter/material.dart';
import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/core/models/study_mode.dart';
import 'package:kana_flutter/widgets/batch_selection_widget.dart';

class StudyModeWidget extends StatelessWidget {

  final Alphabet alphabet;

  StudyModeWidget(this.alphabet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select study mode')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: TextButton(
                child: Text('Practice', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BatchSelectionWidget(this.alphabet, StudyMode.practice)),
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green))),
          ),
          Expanded(
              flex: 5,
              child: TextButton(
                  child:
                  Text('Test', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BatchSelectionWidget(this.alphabet, StudyMode.test)),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.blue)))),
        ],
      ),
    );
  }
}
