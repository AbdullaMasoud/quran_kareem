import 'package:dartz/dartz.dart';
import 'package:musilm_app/features/surah_details/domain/entities/surah_details.dart';

import '../../../../core/error/failures.dart';

abstract class GetSurahDetailsRepository {
  Future<Either<Failure, Surah>> getSurahDetails(
    int? chapterId,
  );
}
