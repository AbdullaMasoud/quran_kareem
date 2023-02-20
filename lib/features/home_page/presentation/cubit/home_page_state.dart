import 'package:musilm_app/features/home_page/domain/entities/pray_time.dart';

abstract class HomePageState {
  const HomePageState();

  // @override
  // List<Object> get props => [];
}

class HomeInitial extends HomePageState {}

class PrayTimeLoadedState extends HomePageState {
  Data prayTime;
  PrayTimeLoadedState({
    required this.prayTime,
  });

  // @override
  // List<Object> get props => [prayTime];
}

class PrayTimeLoadingState extends HomePageState {}

class PrayTimeErrorState extends HomePageState {
  String msg;
  PrayTimeErrorState({
    required this.msg,
  });
  // @override
  // List<Object> get props => [msg];
}

class Emittest extends HomePageState {}

class PrayTimeImageChanged extends HomePageState {}
