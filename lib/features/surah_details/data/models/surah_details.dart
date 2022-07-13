import 'package:musilm_app/features/surah_details/domain/entities/surah_details.dart';

class SurahModel extends Surah {
  const SurahModel({required super.verses});

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        verses: List<Verse>.from(
            json["verses"].map((x) => VerserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
      };
}

class VerserModel extends Verse {
  const VerserModel(
      {required super.id, required super.verseKey, required super.textUthmani});

  factory VerserModel.fromJson(Map<String, dynamic> json) => VerserModel(
        id: json["id"],
        verseKey: json["verse_key"],
        textUthmani: json["text_uthmani"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "verse_key": verseKey,
        "text_uthmani": textUthmani,
      };
}
