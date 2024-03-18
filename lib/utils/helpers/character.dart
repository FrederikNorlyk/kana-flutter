import 'package:kana_flutter/core/models/alphabet.dart';
import 'package:kana_flutter/core/models/batch.dart';

class Character {
  static final _map = {
    Alphabet.hiragana: {
      Batch.basic: [
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
      Batch.dakuten: [
        "が", "ぎ", "ぐ", "げ", "ご",
        "ざ", "じ", "ず", "ぜ", "ぞ",
        "だ", "ぢ", "づ", "で", "ど",
        "ば", "び", "ぶ", "べ", "ぼ"
      ],
      Batch.handakuten: [
        "ぱ", "ぴ", "ぷ", "ぺ", "ぽ"
      ]
    },
    Alphabet.katakana: {
      Batch.basic: [
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
      Batch.dakuten: [
        "ガ", "ギ", "グ", "ゲ", "ゴ",
        "ザ", "ジ", "ズ", "ゼ", "ゾ",
        "ダ", "ヂ", "ヅ", "デ", "ド",
        "バ", "ビ", "ブ", "ベ", "ボ"
      ],
      Batch.handakuten: [
        "パ", "ピ", "プ", "ペ", "ポ"
      ]
    },
    Alphabet.romanji: {
      Batch.basic: [
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
      ],
      Batch.dakuten: [
        "ga", "gi", "gu", "ge", "go",
        "za", "ji", "zu", "ze", "zo",
        "da", "di", "du", "de", "do",
        "ba", "bi", "bu", "be", "bo"
      ],
      Batch.handakuten: [
        "pa", "pi", "pu", "pe", "po"
      ]
    }
  };

  static List<String> get(Alphabet alphabet, Batch batch) {
    return new List.from(_map[alphabet]![batch]!);
  }

  static List<String> getAllIn(Alphabet alphabet) {
    List<String> characters = get(alphabet, Batch.basic);
    characters.addAll(get(alphabet, Batch.dakuten));
    characters.addAll(get(alphabet, Batch.handakuten));

    return characters;
  }
}