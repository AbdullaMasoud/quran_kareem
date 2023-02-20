import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/features/home_page/domain/entities/pray_time.dart';

abstract class GetSpecificPrayTimeRepository {
  Future<Either<Failure, Data>> getSpecificPrayTime(
    Position address,
    String date,
  );
}
