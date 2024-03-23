import 'package:flutter/material.dart';
import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/core/models/kana_item.dart';
import 'package:kana_flutter/core/models/study_mode.dart';
import 'package:kana_flutter/utils/services/kana_service.dart';
import 'package:signature/signature.dart';

class WritingWidget extends StatefulWidget {
  final Alphabet _alphabet;
  StudyMode _mode;
  final int _batchSize;

  WritingWidget(this._alphabet, this._mode, this._batchSize);

  @override
  _WritingWidgetState createState() => _WritingWidgetState(this);
}

class _WritingWidgetState extends State<WritingWidget> {
  late final _service;
  KanaItem? _kanaItem;
  var _isShowingKana;

  final _signatureController = SignatureController(
    penStrokeWidth: 8,
    penColor: Colors.black87,
    exportBackgroundColor: Colors.black87,
  );

  final textStyle = TextStyle(
    fontSize: 100,
    color: Colors.white
  );

  _WritingWidgetState(WritingWidget widget) {
    _service = new KanaService(widget._alphabet, widget._batchSize);
    _kanaItem = _service.getNextKanaItem();
    _isShowingKana = widget._mode == StudyMode.practice;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isWider = size.width > size.height;

    var signature = Expanded(
        flex: 1,
        child: Signature(
          controller: _signatureController,
          backgroundColor: Colors.white,
        )
    );

    var textBox = Expanded(
        flex: 1,
        child: Container(
            color: Colors.black54,
            child: Align(
                alignment: Alignment.center,
                child: Text(_getCharacter(), style: textStyle,
                )
            )
        )
    );

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
                  child: Flex(
                    direction: isWider ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: isWider
                        ? [signature, textBox]
                        : [textBox, signature]
                  ),
                ),
                Expanded(
                  flex: 2, 
                  child: TextButton(
                    onPressed: () => _nextButtonPressed(context), 
                    child: Text('Next'),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 40),
                    ),
                  )
                )
              ]
            )
        )
    );
  }

  void _nextButtonPressed(BuildContext context) {
    setState(() {
      if (_isShowingKana) {
        _kanaItem = _service.getNextKanaItem();
        _signatureController.clear();
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
