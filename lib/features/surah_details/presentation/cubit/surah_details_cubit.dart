import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/utils/const_manager.dart';

import 'package:musilm_app/features/surah_details/domain/entities/surah_details.dart';
import 'package:musilm_app/features/surah_details/domain/usecases/get_surah_details.dart';

part 'surah_details_state.dart';

class SurahDetailsCubit extends Cubit<SurahDetailsState> {
  final GetSurahDetailsUseCase getSurahDetailsUseCase;
  SurahDetailsCubit({
    required this.getSurahDetailsUseCase,
  }) : super(SurahDetailsInitial());

  static SurahDetailsCubit get(context) => BlocProvider.of(context);

  Future<void> getSurahDetails(int chapterId) async {
    Either<Failure, Surah> response =
        await getSurahDetailsUseCase(SurahDetailsParams(chapterId: chapterId));
    emit(response.fold(
        (failure) => SurahDetailsError(msg: _mapFailureToMsg(failure)),
        (surah) => SurahDetailsLoaded(surah: surah)));
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
