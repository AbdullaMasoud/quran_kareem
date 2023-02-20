import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/usecases/usecases.dart';
import 'package:musilm_app/features/azkar_details/domain/entities/azkar.dart';

import '../../../../core/utils/const_manager.dart';
import '../../domain/usecases/get_azkar.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final GetAzkar getAzkar;

  AzkarCubit({
    required this.getAzkar,
  }) : super(AzkarInitial());

  static AzkarCubit get(context) => BlocProvider.of(context);

  Future<void> getAzkars(String category) async {
    Either<Failure, List<AzkarData>> response = await getAzkar(NoParams());
    emit(response.fold(
        (failure) => GetAzkarError(msg: _mapFailureToMsg(failure)),
        (azkar) => GetAzkarLoaded(azkar: azkarByCategory(category, azkar))));
  }

  List<AzkarData> azkarListByCategory = [];

  List<AzkarData> azkarByCategory(
      String category, List<AzkarData> filteredList) {
    azkarListByCategory.clear();
    for (var element in filteredList) {
      if (element.category == category) {
        azkarListByCategory.add(element);
      }
    }
    emit(GetAzkarByCategoryLoading());
    // print(azkarListByCategory);
    return azkarListByCategory;
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case CacheFailure:
        return ConstentManager.cacheFailure;
      default:
        return ConstentManager.unexpectedError;
    }
  }
}
