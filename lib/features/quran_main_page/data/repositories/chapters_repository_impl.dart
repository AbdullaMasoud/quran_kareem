import 'package:dartz/dartz.dart';
import 'package:musilm_app/core/error/exceptions.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/network/network_info.dart';
import 'package:musilm_app/features/quran_main_page/data/datasources/chapter_remote_data_source.dart';
import 'package:musilm_app/features/quran_main_page/domain/entities/chapters.dart';
import 'package:musilm_app/features/quran_main_page/domain/repositories/chapters_repository.dart';

class ChaptersRepositoryImpl implements ChaptersRepository {
  final NetworkInfo networkInfo;
  final ChaptersRemoteDataSource chaptersRemoteDataSource;
  // final ChapterLocalDataSource chapterLocalDataSource;
  ChaptersRepositoryImpl({
    required this.networkInfo,
    required this.chaptersRemoteDataSource,
    // required this.chapterLocalDataSource,
  });
  @override
  Future<Either<Failure, List<Chapter>>> getSurahIndex() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteChapter = await chaptersRemoteDataSource.getSurahIndex();
        // chapterLocalDataSource.cacheChapter(remoteChapter);
        return Right(remoteChapter);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteChapter = await chaptersRemoteDataSource.getSurahIndex();
        // chapterLocalDataSource.cacheChapter(remoteChapter);
        return Right(remoteChapter);
      } on ServerException {
        return Left(ServerFailure());
      }

      // try {
      //   final cacheChapter = await chapterLocalDataSource.getLastSurahIndex();
      //   return Right(cacheChapter);
      // } on CacheException {
      //   return Left(CacheFailure());
      // }
      // }
    }
  }
}
