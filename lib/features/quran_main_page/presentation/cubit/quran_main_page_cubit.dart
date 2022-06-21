import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/usecases/usecases.dart';
import 'package:musilm_app/core/utils/const_manager.dart';
import 'package:musilm_app/features/quran_main_page/domain/entities/chapters.dart';
import 'package:musilm_app/features/quran_main_page/domain/usecases/get_surah_index.dart';

part 'quran_main_page_state.dart';

class QuranMainPageCubit extends Cubit<QuranMainPageState> {
  final GetSurahIndex getSurahIndex;
  QuranMainPageCubit({
    required this.getSurahIndex,
  }) : super(QuranMainPageInitial());

  Future<void> getSurahInde() async {
    Either<Failure, List<Chapter>> response = await getSurahIndex(NoParams());
    emit(response.fold(
        (failure) => GetSurahIndexError(msg: _mapFailureToMsg(failure)),
        (chapters) => GetSurahIndexLoaded(chapters: chapters)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return ConstentManager.serverFailure;
      case CacheFailure:
        return ConstentManager.cacheFailure;
      default:
        return ConstentManager.unexpectedError;
    }
  }
}
