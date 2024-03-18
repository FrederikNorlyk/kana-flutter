import 'package:flutter/material.dart';
import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/core/models/batch.dart';
import 'package:kana_flutter/core/models/kana_item.dart';
import 'package:kana_flutter/core/models/study_mode.dart';
import 'package:kana_flutter/utils/services/kana_service.dart';
import 'package:signature/signature.dart';

class WritingWidget extends StatefulWidget {
  final Alphabet _alphabet;
  var _mode;
  final Batch _batch;
  final int _batchSize;

  WritingWidget(this._alphabet, this._mode, this._batch, this._batchSize);

  @override
  _WritingWidgetState createState() => _WritingWidgetState(this);
}

class _WritingWidgetState extends State<WritingWidget> {
  late final _service;
  KanaItem? _kanaItem;
  var _isShowingKana;

  final _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.blue,
    exportBackgroundColor: Colors.blue,
  );

  final textStyle = TextStyle(
    fontSize: 100,
    color: Colors.white
  );

  _WritingWidgetState(WritingWidget widget) {
    _service = new KanaService(widget._alphabet, widget._batch, widget._batchSize);
    _kanaItem = _service.getNextKanaItem();
    _isShowingKana = widget._mode == StudyMode.practice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._alphabet.name),
        ),
        body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(_getCharacter(), style: textStyle,
                            )
                          )
                        )
                      ),
                      Signature(
                        controller: _controller,
                        backgroundColor: Colors.white,
                      )
                    ]
                  ),
                ),
                Expanded(flex: 1, child: TextButton(onPressed: () => _nextButtonPressed(context), child: Text('Next')))
              ]
            )
        )
    );
  }

  void _nextButtonPressed(BuildContext context) {
    setState(() {
      if (_isShowingKana) {
        _kanaItem = _service.getNextKanaItem();
        _controller.clear();
      }

      if (widget._mode == StudyMode.practice) {
        _isShowingKana = true;
      } else {
        _isShowingKana = !_isShowingKana;
      }

      if (_kanaItem == null) {
        if (widget._mode == StudyMode.practice) {
          widget._mode = StudyMode.test;
          _service.restart();
          _nextButtonPressed(context);
        } else {
          Navigator.of(context).pop();
        }
      }
    });
  }

  String _getCharacter() {
    if (_kanaItem == null) {
      return "";
    }

    if (widget._mode == StudyMode.practice) {
      return _kanaItem!.romanji + " " +_kanaItem!.kana;
    } else {
      return _isShowingKana ? _kanaItem!.kana : _kanaItem!.romanji;
    }
  }
}
