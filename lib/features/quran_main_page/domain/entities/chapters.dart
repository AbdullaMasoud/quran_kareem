// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class Chapters extends Equatable {
  final List<Chapter>? chapters;
  Chapters({
    required this.chapters,
  });
  @override
  List<Object?> get props => [chapters];
}

class Chapter extends Equatable {
  final int id;
  final String? revelationPlace;
  final String? englishName;
  final String? arabicName;
  final int? versesCount;
  final List<int>? pages;
  Chapter({
    required this.id,
    required this.revelationPlace,
    required this.englishName,
    required this.arabicName,
    required this.versesCount,
    required this.pages,
  });

  @override
  List<Object?> get props =>
      [revelationPlace, englishName, arabicName, versesCount, id];

  toJson() {}
}
