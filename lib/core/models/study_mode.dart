enum StudyMode {
  practice,
  test
}

extension StudyModeExtension on StudyMode {

  String get name {
    switch (this) {
      case StudyMode.practice:
        return 'Practice';
      case StudyMode.test:
        return 'Test';
      default:
        return "";
    }
  }
  
  String get image {
    switch (this) {
      case StudyMode.practice:
        return 'pratice.jpg';
      case StudyMode.test:
        return 'test.jpg';
      default:
        return "";
    }
  }
}
