class Juzs {
  Juzs({
    required this.juzs,
  });

  List<Juz> juzs;
}

class Juz {
  Juz({
    required this.id,
    required this.juzNumber,
    required this.verseMapping,
    required this.firstVerseId,
    required this.lastVerseId,
    required this.versesCount,
  });

  int id;
  int juzNumber;
  Map<String, String> verseMapping;
  int firstVerseId;
  int lastVerseId;
  int versesCount;
}
