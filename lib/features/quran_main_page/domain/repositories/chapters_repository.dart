import 'package:dartz/dartz.dart';
import 'package:musilm_app/core/error/failures.dart';

abstract class ChaptersRepository {
  Future<Either<Failure, dynamic>> getSurahIndex();
}
