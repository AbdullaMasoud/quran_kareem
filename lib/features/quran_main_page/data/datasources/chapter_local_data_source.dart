import 'dart:convert';

import 'package:musilm_app/core/error/exceptions.dart';
import 'package:musilm_app/core/utils/const_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:musilm_app/features/quran_main_page/data/models/chapters_model.dart';

abstract class ChapterLocalDataSource {
  Future<ChaptersModel> getLastSurahIndex();
  Future<void> cacheChapter(ChaptersModel chapterModel);
}

class ChapterLocalDataSourceImpl implements ChapterLocalDataSource {
  final SharedPreferences sharedPreferences;
  ChapterLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> cacheChapter(ChaptersModel chapterModel) {
    return sharedPreferences.setString(
        ConstentManager.cachedChapters, jsonEncode(chapterModel));
  }

  @override
  Future<ChaptersModel> getLastSurahIndex() {
    final jsonString =
        sharedPreferences.getString(ConstentManager.cachedChapters);
    if (jsonString != null) {
      final cacheChapter =
          Future.value(ChaptersModel.fromJson(jsonDecode(jsonString)));
      return cacheChapter;
    } else {
      throw CacheException();
    }
  }
}
