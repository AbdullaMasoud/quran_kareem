import 'package:geolocator/geolocator.dart';
import 'package:musilm_app/core/api/api_consumer.dart';
import 'package:musilm_app/core/api/end_points.dart';
import 'package:musilm_app/features/home_page/data/models/pray_time.dart';

abstract class SpecificPrayTimeRemoteDataSource {
  Future<DataModel> getSpecificPrayTime(
    Position address,
    String date,
  );
}

class SpecificPrayTimeRemoteDataSourceImpl
    implements SpecificPrayTimeRemoteDataSource {
  ApiConsumer apiConsumer;
  SpecificPrayTimeRemoteDataSourceImpl({
    required this.apiConsumer,
  });
  @override
  Future<DataModel> getSpecificPrayTime(
    Position position,
    String date,
  ) async {
    var response =
        await apiConsumer.get(EndPoints.prayTime + date, queryParameters: {
      'latitude': position.latitude,
      'longitude': position.longitude,
      'method': '5',
    });
    return DataModel.fromJson(response);
  }
}
