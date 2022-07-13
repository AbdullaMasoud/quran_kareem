import 'package:musilm_app/core/api/api_consumer.dart';
import 'package:musilm_app/core/api/end_points.dart';
import 'package:musilm_app/features/quran_main_page/data/models/chapters_model.dart';

abstract class ChaptersRemoteDataSource {
  Future<ChaptersModel> getSurahIndex();
}

class ChaptersRemoteDataSourceImpl implements ChaptersRemoteDataSource {
  ApiConsumer apiConsumer;
  ChaptersRemoteDataSourceImpl({
    required this.apiConsumer,
  });
  @override
  Future<ChaptersModel> getSurahIndex() async {
    final response = await apiConsumer.get(EndPoints.chapters);
    return ChaptersModel.fromJson(response);
  }
}
