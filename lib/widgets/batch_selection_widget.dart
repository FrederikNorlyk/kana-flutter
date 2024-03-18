import 'package:flutter/material.dart';
import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/core/models/batch.dart';
import 'package:kana_flutter/core/models/study_mode.dart';
import 'package:kana_flutter/widgets/batch_size_widget.dart';

class BatchSelectionWidget extends StatelessWidget {

  final Alphabet alphabet;
  final StudyMode mode;

  BatchSelectionWidget(this.alphabet, this.mode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select batch')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _getBatchRows(context),
      ),
    );
  }

  List<Widget> _getBatchRows(BuildContext context) {
    final batches = [
      Batch.basic,
      Batch.all,
      Batch.dakuten,
      Batch.handakuten
    ];

    List<Widget> children = [];
    for (var batch in batches) {
      children.add(Expanded(
        flex: 1,
        child: TextButton(
            child: Text(batch.toString(), style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BatchSizeWidget(this.alphabet, this.mode, batch)),
              );
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green))),
      ));
    }

    return children;
  }
}
