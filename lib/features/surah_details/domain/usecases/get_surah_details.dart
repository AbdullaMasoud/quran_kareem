import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/usecases/usecases.dart';
import 'package:musilm_app/features/surah_details/domain/entities/surah_details.dart';
import 'package:musilm_app/features/surah_details/domain/repositories/get_surah_details_repository.dart';

class GetSurahDetailsUseCase implements UseCase<Surah, SurahDetailsParams> {
  final GetSurahDetailsRepository getSurahDetailsRepository;
  GetSurahDetailsUseCase({
    required this.getSurahDetailsRepository,
  });
  @override
  Future<Either<Failure, Surah>> call(SurahDetailsParams params) {
    return getSurahDetailsRepository.getSurahDetails(params.chapterId);
  }
}

class SurahDetailsParams extends Equatable {
  final int? chapterId;
  const SurahDetailsParams({
    required this.chapterId,
  });
  @override
  List<Object?> get props => [chapterId];
}
