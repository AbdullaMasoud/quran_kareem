import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  const Surah({
    required this.verses,
  });

  final List<Verse> verses;

  @override
  List<Object?> get props => [verses];
}

class Verse extends Equatable {
  const Verse({
    required this.id,
    required this.verseKey,
    required this.textUthmani,
  });

  final int id;
  final String verseKey;
  final String textUthmani;

  @override
  List<Object?> get props => [id, verseKey, textUthmani];

  toJson() {}
}
