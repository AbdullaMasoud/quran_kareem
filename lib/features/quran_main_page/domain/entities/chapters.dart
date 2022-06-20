import 'package:equatable/equatable.dart';

class Chapter extends Equatable {
  final int id;
  final String revelationPlace;
  final String englishName;
  final String arabicName;
  final int versesCount;
  final List<int> pages;
  const Chapter({
    required this.id,
    required this.revelationPlace,
    required this.englishName,
    required this.arabicName,
    required this.versesCount,
    required this.pages,
  });

  @override
  List<Object?> get props =>
      [revelationPlace, englishName, arabicName, versesCount];
}
