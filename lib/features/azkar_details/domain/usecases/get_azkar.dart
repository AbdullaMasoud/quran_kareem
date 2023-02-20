import 'package:musilm_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:musilm_app/core/usecases/usecases.dart';
import 'package:musilm_app/features/azkar_details/domain/entities/azkar.dart';
import 'package:musilm_app/features/azkar_details/domain/repositories/azkar_repository.dart';

class GetAzkar implements UseCase<List<AzkarData>, NoParams> {
  final AzkarRepository azkarRepository;

  GetAzkar({required this.azkarRepository});
  @override
  Future<Either<Failure, List<AzkarData>>> call(NoParams params) {
    return azkarRepository.getAzkar();
  }
}


// class AzkarDetailsParams extends Equatable {
//   final String? category;
//   const AzkarDetailsParams({
//     this.category,
//   });
//   @override
//   List<Object?> get props => [category];
// }
