import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/utils/helpers/character.dart';

enum BatchSize {
  five,
  ten,
  fifteen,
  all
}

extension StudyModeExtension on BatchSize {

  String get name {
    switch (this) {
      case BatchSize.five:
        return '5';
      case BatchSize.ten:
        return '10';
      case BatchSize.fifteen:
        return '15';
      case BatchSize.all:
      default:
        return "All";
    }
  }

  int get count {
    switch (this) {
      case BatchSize.five:
        return 5;
      case BatchSize.ten:
        return 10;
      case BatchSize.fifteen:
        return 15;
      case BatchSize.all:
      default:
        return Character.get(Alphabet.hiragana).length;
    }
  }
}
