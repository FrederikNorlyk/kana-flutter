import 'dart:math';

import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/core/models/kana_item.dart';
import 'package:kana_flutter/utils/helpers/character.dart';

class KanaService {
  late List<String> _seenKanaCharacters = [];
  late List<String> _seenRomanjiCharacters = [];

  late List<String> _remainingKanaCharacters;
  late List<String> _remainingRomanjiCharacters;

  late int _limit;
  
  final random = Random();

  KanaService(Alphabet alphabet, int limit) {
    this._remainingKanaCharacters = Character.get(alphabet);
    this._remainingRomanjiCharacters = Character.get(Alphabet.romanji);
    this._limit = limit;
  }

  void restart() {
    _remainingKanaCharacters = List.from(_seenKanaCharacters);
    _remainingRomanjiCharacters = List.from(_seenRomanjiCharacters);

    _seenKanaCharacters.clear();
    _seenRomanjiCharacters.clear();
  }

  KanaItem? getNextKanaItem() {
    if (_remainingKanaCharacters.length == 0 || _seenKanaCharacters.length == _limit) {
      return null;
    }

    var index = random.nextInt(_remainingKanaCharacters.length);
    var kana = _remainingKanaCharacters[index];
    var romanji = _remainingRomanjiCharacters[index];
    var kanaItem = KanaItem(romanji, kana);

    _seenKanaCharacters.add(kana);
    _seenRomanjiCharacters.add(romanji);

    _remainingKanaCharacters.removeAt(index);
    _remainingRomanjiCharacters.removeAt(index);

    return kanaItem;
  }
}
