import 'package:dartz/dartz.dart';

import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/usecases/usecases.dart';
import 'package:musilm_app/features/quran_main_page/domain/repositories/chapters_repository.dart';

class GetSurahIndex implements UseCase<dynamic, NoParams> {
  final ChaptersRepository chaptersRepository;
  GetSurahIndex({
    required this.chaptersRepository,
  });
  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return chaptersRepository.getSurahIndex();
  }
}

// if there is params
/* 
class LoginParams extends Equatable {
  final String userName;
  final String passWord;
  const LoginParams({
    required this.userName,
    required this.passWord,
  });
  @override
  List<Object?> get props => [userName, passWord];
}
*/


