import 'package:dartz/dartz.dart';
import 'package:musilm_app/core/error/exceptions.dart';

import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/network/network_info.dart';
import 'package:musilm_app/features/surah_details/data/datasources/surah_details_local_data_source.dart';
import 'package:musilm_app/features/surah_details/data/datasources/surah_details_remote_data_source.dart';
import 'package:musilm_app/features/surah_details/domain/entities/surah_details.dart';
import 'package:musilm_app/features/surah_details/domain/repositories/get_surah_details_repository.dart';

class GetSurahDetailsRepositoryImpl implements GetSurahDetailsRepository {
  final NetworkInfo networkInfo;
  final GetSurahDetailsRemoteDataSource getSurahDetailsRemoteDataSource;
  final GetSurahDetailsLocalDataSource getSurahDetailsLocalDataSource;
  GetSurahDetailsRepositoryImpl({
    required this.networkInfo,
    required this.getSurahDetailsRemoteDataSource,
    required this.getSurahDetailsLocalDataSource,
  });
  @override
  Future<Either<Failure, Surah>> getSurahDetails(int? chapterId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSurahDetails =
            await getSurahDetailsRemoteDataSource.getSurahDetails(chapterId);
        getSurahDetailsLocalDataSource.cacheSurahDetails(remoteSurahDetails);
        return Right(remoteSurahDetails);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheSurahDetails =
            await getSurahDetailsLocalDataSource.getLastSurahDetails(chapterId);
        return Right(cacheSurahDetails);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
