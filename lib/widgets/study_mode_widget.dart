import 'package:flutter/material.dart';
import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/core/models/study_mode.dart';
import 'package:kana_flutter/widgets/batch_size_widget.dart';

class StudyModeWidget extends StatelessWidget {

  final Alphabet alphabet;

  StudyModeWidget(this.alphabet);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isWider = size.width > size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Select study mode')),
      body: Flex(
        direction: isWider ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildButtons(context)
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    List<Widget> result = [];

    final studyModes = [
      StudyMode.practice,
      StudyMode.test
    ];

    for (var studyMode in studyModes) {
      result.add(Expanded(
          flex: 1,
          child: Stack(children: [
            SizedBox.expand(child: Image(fit: BoxFit.cover, image: AssetImage("resources/graphics/" + studyMode.image), width: double.infinity)),
            SizedBox.expand(child: TextButton(
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Text(studyMode.name, style: TextStyle(color: Colors.white, fontSize: 50)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BatchSizeWidget(this.alphabet, studyMode)),
                );
              },
            ))
          ])
      ));
    }

    return result;
  }
}
