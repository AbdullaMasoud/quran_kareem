part of 'surah_details_cubit.dart';

abstract class SurahDetailsState extends Equatable {
  const SurahDetailsState();

  @override
  List<Object> get props => [];
}

class SurahDetailsInitial extends SurahDetailsState {}

class SurahDetailsLoaded extends SurahDetailsState {
  final Surah surah;
  const SurahDetailsLoaded({
    required this.surah,
  });
  @override
  List<Object> get props => [surah];
}

class SurahDetailsLoading extends SurahDetailsState {}

class SurahDetailsError extends SurahDetailsState {
  final String msg;
  const SurahDetailsError({
    required this.msg,
  });

  @override
  List<Object> get props => [msg];
}
