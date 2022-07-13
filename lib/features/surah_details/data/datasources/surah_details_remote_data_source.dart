import 'package:musilm_app/core/api/api_consumer.dart';
import 'package:musilm_app/core/api/end_points.dart';
import 'package:musilm_app/features/surah_details/data/models/surah_details.dart';

abstract class GetSurahDetailsRemoteDataSource {
  Future<SurahModel> getSurahDetails(int? chapterId);
}

class GetSurahDetailsRemoteDataSourceImpl
    implements GetSurahDetailsRemoteDataSource {
  final ApiConsumer apiConsumer;

  GetSurahDetailsRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<SurahModel> getSurahDetails(int? chapterId) async {
    final response = await apiConsumer.get(
        EndPoints.surahDetails + EndPoints.uthmani,
        queryParameters: {'chapter_number': chapterId});
    return SurahModel.fromJson(response);
  }
}
