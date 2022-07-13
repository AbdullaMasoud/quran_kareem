import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:musilm_app/core/error/exceptions.dart';

import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/network/network_info.dart';
import 'package:musilm_app/features/home/data/datasources/pray_time_remote_data_source.dart';
import 'package:musilm_app/features/home/domain/entities/pray_time.dart';
import 'package:musilm_app/features/home/domain/repositories/get_today_pray_time_repository.dart';

class GetSpecificPrayTimeRepositoryImpl
    implements GetSpecificPrayTimeRepository {
  NetworkInfo networkInfo;
  SpecificPrayTimeRemoteDataSource specificPrayTimeRemoteDataSource;
  GetSpecificPrayTimeRepositoryImpl({
    required this.networkInfo,
    required this.specificPrayTimeRemoteDataSource,
  });

  @override
  Future<Either<Failure, Data>> getSpecificPrayTime(
    Position address,
    String date,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        var remotePrayTime =
            await specificPrayTimeRemoteDataSource.getSpecificPrayTime(
          address,
          date,
        );
        return Right(remotePrayTime);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        var remotePrayTime =
            await specificPrayTimeRemoteDataSource.getSpecificPrayTime(
          address,
          date,
        );
        return Right(remotePrayTime);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
