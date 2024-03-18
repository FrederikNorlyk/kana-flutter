enum Alphabet {
  hiragana,
  katakana,
  romanji
}

extension AlphabetExtension on Alphabet {

  String get name {
    switch (this) {
      case Alphabet.hiragana:
        return 'Hiragana';
      case Alphabet.katakana:
        return 'Katakana';
      case Alphabet.romanji:
      default:
        return "Romanji";
    }
  }

  String get image {
    switch (this) {
      case Alphabet.hiragana:
        return 'hiragana.jpg';
      case Alphabet.katakana:
        return 'katakana.jpg';
      case Alphabet.romanji:
      default:
        return "";
    }
  }
}