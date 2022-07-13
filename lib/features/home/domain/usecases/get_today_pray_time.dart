import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import 'package:musilm_app/features/home/domain/entities/pray_time.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/usecases/usecases.dart';
import 'package:musilm_app/features/home/domain/repositories/get_today_pray_time_repository.dart';

class GetSpecificPrayTime implements UseCase<Data, SpecificPrayTimeParams> {
  final GetSpecificPrayTimeRepository specificPrayTimeRepository;
  GetSpecificPrayTime({
    required this.specificPrayTimeRepository,
  });
  @override
  Future<Either<Failure, Data>> call(SpecificPrayTimeParams params) {
    return specificPrayTimeRepository.getSpecificPrayTime(
        params.address, params.date);
  }
}

class SpecificPrayTimeParams extends Equatable {
  Position address;
  String date;

  // DateTime time;
  SpecificPrayTimeParams({
    required this.address,
    required this.date,
  });
  @override
  List<Object?> get props => [address, date];
}
