import 'package:musilm_app/features/quran_main_page/data/models/chapters_model.dart';

abstract class ChaptersRemoteDataSource {
  Future<List<ChaptersModel>> getSurahIndex();
}

class ChaptersRemoteDataSourceImpl implements ChaptersRemoteDataSource {
  @override
  Future<List<ChaptersModel>> getSurahIndex() {
    throw UnimplementedError();
  }
}
