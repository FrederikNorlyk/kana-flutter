import 'package:flutter/material.dart';
import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/core/models/batch.dart';
import 'package:kana_flutter/core/models/study_mode.dart';
import 'package:kana_flutter/widgets/writing_widget.dart';

class BatchSizeWidget extends StatelessWidget {

  final Alphabet _alphabet;
  final StudyMode _mode;
  final Batch _batch;

  BatchSizeWidget(this._alphabet, this._mode, this._batch);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select batch size')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _getBatchSizes(context),
      ),
    );
  }

  List<Widget> _getBatchSizes(BuildContext context) {
    final sizes = [
      5, 10, 15, 20, 1000
    ];

    List<Widget> children = [];
    for (var size in sizes) {
      children.add(Expanded(
        flex: 1,
        child: TextButton(
            child: Text(size.toString(), style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WritingWidget(this._alphabet, this._mode, this._batch, size)),
              );
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green))),
      ));
    }

    return children;
  }
}
