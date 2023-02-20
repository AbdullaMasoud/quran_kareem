import 'package:dartz/dartz.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/features/azkar_details/domain/entities/azkar.dart';

abstract class AzkarRepository {
  Future<Either<Failure, List<AzkarData>>> getAzkar();
}
