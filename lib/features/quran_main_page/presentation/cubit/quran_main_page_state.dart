part of 'quran_main_page_cubit.dart';

abstract class QuranMainPageState extends Equatable {
  const QuranMainPageState();

  @override
  List<Object> get props => [];
}

class QuranMainPageInitial extends QuranMainPageState {}

class GetSurahIndexLoading extends QuranMainPageState {}

class GetSurahIndexLoaded extends QuranMainPageState {
  final Chapters chapters;
  const GetSurahIndexLoaded({
    required this.chapters,
  });

  @override
  List<Object> get props => [chapters];
}

class GetSurahIndexError extends QuranMainPageState {
  final String msg;
  const GetSurahIndexError({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}
