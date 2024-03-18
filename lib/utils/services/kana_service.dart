import 'dart:math';

import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/core/models/batch.dart';
import 'package:kana_flutter/core/models/kana_item.dart';
import 'package:kana_flutter/utils/helpers/character.dart';

class KanaService {
  late List<String> _seenKana = [];
  late List<String> _seenRomanji = [];

  late List<String> _kana;
  late List<String> _romanji;

  var _limit;

  KanaService(Alphabet alphabet, Batch batch, int limit) {
    if (batch == Batch.all) {
      this._kana = Character.getAllIn(alphabet);
      this._romanji = Character.getAllIn(Alphabet.romanji);
    } else {
      this._kana = Character.get(alphabet, batch);
      this._romanji = Character.get(Alphabet.romanji, batch);
    }

    this._limit = limit;
  }

  void restart() {
    _kana = List.from(_seenKana);
    _romanji = List.from(_seenRomanji);

    _seenKana.clear();
    _seenRomanji.clear();
  }

  KanaItem? getNextKanaItem() {
    if (_kana.length == 0 || _seenKana.length == _limit) {
      return null;
    }

    var index;
    if (_kana.length == 1) {
      index = 0;
    } else {
      final rng = Random();
      index = rng.nextInt(_kana.length - 1);
    }

    var kanaCharacter = _kana[index];
    var romanjiCharacter = _romanji[index];
    var kanaItem = KanaItem(romanjiCharacter, kanaCharacter);

    _seenKana.add(kanaCharacter);
    _seenRomanji.add(romanjiCharacter);

    _kana.removeAt(index);
    _romanji.removeAt(index);

    return kanaItem;
  }
}