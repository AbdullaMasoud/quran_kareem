import 'package:dartz/dartz.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/features/quran_main_page/domain/entities/juz.dart';

abstract class JuzsRepository {
  Future<Either<Failure, Juzs>> getJuzList();
}
