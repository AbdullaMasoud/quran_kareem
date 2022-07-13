import 'dart:convert';

import 'package:musilm_app/core/error/exceptions.dart';
import 'package:musilm_app/core/utils/const_manager.dart';
import 'package:musilm_app/features/surah_details/data/models/surah_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetSurahDetailsLocalDataSource {
  Future<SurahModel> getLastSurahDetails(int? chapterId);
  Future<void> cacheSurahDetails(SurahModel surahModel);
}

class GetSurahDetailsLocalDataSourceImpl
    implements GetSurahDetailsLocalDataSource {
  final SharedPreferences sharedPreferences;

  GetSurahDetailsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheSurahDetails(SurahModel surahModel) {
    return sharedPreferences.setString(
        ConstentManager.cachedChapters, jsonEncode(surahModel));
  }

  @override
  Future<SurahModel> getLastSurahDetails(int? chapterId) {
    final jsonString =
        sharedPreferences.getString(ConstentManager.cachedSurahDetails);
    if (jsonString != null) {
      final cacheSurahDetails =
          Future.value(SurahModel.fromJson(jsonDecode(jsonString)));
      return cacheSurahDetails;
    } else {
      throw CacheException();
    }
  }
}
