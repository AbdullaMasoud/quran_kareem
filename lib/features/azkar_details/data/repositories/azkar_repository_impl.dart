import 'package:musilm_app/core/error/exceptions.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:musilm_app/features/azkar_details/data/datasources/azkar_local_data_source.dart';
import 'package:musilm_app/features/azkar_details/domain/entities/azkar.dart';
import 'package:musilm_app/features/azkar_details/domain/repositories/azkar_repository.dart';

class GetAazkarRepositoryImpl implements AzkarRepository {
  final GetAzkarLocalDataSource azkarLocalDataSource;

  GetAazkarRepositoryImpl({required this.azkarLocalDataSource});
  @override
  Future<Either<Failure, List<AzkarData>>> getAzkar() async {
    try {
      final response = await azkarLocalDataSource.getazkar();
      return Right(response);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
