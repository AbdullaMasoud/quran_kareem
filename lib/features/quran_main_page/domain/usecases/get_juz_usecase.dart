import 'package:dartz/dartz.dart';

import 'package:musilm_app/features/quran_main_page/domain/entities/juz.dart';
import 'package:musilm_app/features/quran_main_page/domain/repositories/juzs_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';

class GetJuzList implements UseCase<Juzs, NoParams> {
  JuzsRepository juzsRepository;
  GetJuzList({
    required this.juzsRepository,
  });
  @override
  Future<Either<Failure, Juzs>> call(NoParams params) {
    return juzsRepository.getJuzList();
  }
}
