import 'package:musilm_app/features/quran_main_page/domain/entities/chapters.dart';

class ChaptersModel {
  final List<ChapterModel> chapters;
  ChaptersModel({
    required this.chapters,
  });

  factory ChaptersModel.fromJson(Map<String, dynamic> json) => ChaptersModel(
      chapters: List<ChapterModel>.from(json["chapters"]
          .map((x) => ChapterModel.fromJson(x as Map<String, dynamic>))));
}

class ChapterModel extends Chapter {
  const ChapterModel({
    required int id,
    required String revelationPlace,
    required String englishName,
    required String arabicName,
    required int versesCount,
    required List<int> pages,
  }) : super(
          pages: pages,
          versesCount: versesCount,
          englishName: englishName,
          arabicName: arabicName,
          revelationPlace: revelationPlace,
          id: id,
        );

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        id: json["id"],
        revelationPlace: json["revelation_place"],
        englishName: json["name_simple"],
        arabicName: json["name_arabic"],
        versesCount: json["verses_count"],
        pages: List<int>.from(json["pages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "revelation_place": revelationPlace,
        "name_simple": englishName,
        "name_arabic": arabicName,
        "verses_count": versesCount,
        "pages": List<dynamic>.from(pages.map((x) => x)),
      };
}
