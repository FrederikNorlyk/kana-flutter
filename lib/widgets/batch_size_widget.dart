import 'package:flutter/material.dart';
import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/core/models/batch_size.dart';
import 'package:kana_flutter/core/models/study_mode.dart';
import 'package:kana_flutter/widgets/writing_widget.dart';

class BatchSizeWidget extends StatelessWidget {

  final Alphabet _alphabet;
  final StudyMode _mode;

  BatchSizeWidget(this._alphabet, this._mode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select batch size')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(fit: BoxFit.cover, image: AssetImage("resources/graphics/" + _mode.image), width: double.infinity),
          Container(margin: new EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0), child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _getBatchSizes(context),
          )
          )]
      )
    );
  }

  List<Widget> _getBatchSizes(BuildContext context) {
    List<Widget> children = [];

    children.add(SizedBox(height: 10));

    for (var i = 0; i < BatchSize.values.length; i++) {

      var size = BatchSize.values[i];

      children.add(Expanded(
        flex: 1,
        child: TextButton(
            style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.black54)
            ),
            child: Text(size.name, style: TextStyle(color: Colors.white, fontSize: 50)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WritingWidget(this._alphabet, this._mode, size.count)),
              );
            },
        )
      ));

      if (i < BatchSize.values.length - 1) {
        children.add(SizedBox(height: 25));
      }
    }

    return children;
  }
}
