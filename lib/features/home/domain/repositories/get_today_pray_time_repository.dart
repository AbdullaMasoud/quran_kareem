import 'package:dartz/dartz.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/features/home/domain/entities/pray_time.dart';

abstract class GetSpecificPrayTimeRepository {
  Future<Either<Failure, Data>> getSpecificPrayTime(
    Position address,
    String date,
  );
}
