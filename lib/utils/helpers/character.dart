import 'package:kana_flutter/core/models/alphabet.dart';

class Character {
  static final _map = {
    Alphabet.hiragana: [
      "あ", "い", "う", "え", "お",
      "か", "き", "く", "け", "こ",
      "さ", "し", "す", "せ", "そ",
      "た", "ち", "つ", "て", "と",
      "な", "に", "ぬ", "ね", "の",
      "は", "ひ", "ふ", "へ", "ほ",
      "ま", "み", "む", "め", "も",
      "や", "ゆ", "よ",
      "ら", "り", "る", "れ", "ろ",
      "わ", "を",
      "ん"
    ],
    Alphabet.katakana: [
      "ア", "イ", "ウ", "エ", "オ",
      "カ", "キ", "ク", "ケ", "コ",
      "サ", "シ", "ス", "セ", "ソ",
      "タ", "チ", "ツ", "テ", "ト",
      "ナ", "ニ", "ヌ", "ネ", "ノ",
      "ハ", "ヒ", "フ", "ヘ", "ホ",
      "マ", "ミ", "ム", "メ", "モ",
      "ヤ", "ユ", "ヨ",
      "ラ", "リ", "ル", "レ", "ロ",
      "ワ", "ヲ",
      "ン"
    ],
    Alphabet.romanji: [
      "a", "i", "u", "e", "o",
      "ka", "ki", "ku", "ke", "ko",
      "sa", "shi", "su", "se", "so",
      "ta", "chi", "tsu", "te", "to",
      "na", "ni", "nu", "ne", "no",
      "ha", "hi", "hu/fu", "he", "ho",
      "ma", "mi", "mu", "me", "mo",
      "ya", "yu", "yo",
      "ra", "ri", "ru", "re", "ro",
      "wa", "wo",
      "n"
    ]
  };

  static List<String> get(Alphabet alphabet) {
    return new List.from(_map[alphabet]!);
  }
}
