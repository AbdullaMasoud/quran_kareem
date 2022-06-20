import 'package:dartz/dartz.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/features/quran_main_page/domain/entities/chapters.dart';

abstract class ChaptersRepository {
  Future<Either<Failure, List<Chapter>>> getSurahIndex();
}
