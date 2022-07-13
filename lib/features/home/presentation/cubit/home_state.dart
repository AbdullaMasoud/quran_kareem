part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();

  // @override
  // List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class PrayTimeLoadedState extends HomeState {
  Data prayTime;
  PrayTimeLoadedState({
    required this.prayTime,
  });

  // @override
  // List<Object> get props => [prayTime];
}

class PrayTimeLoadingState extends HomeState {}

class PrayTimeErrorState extends HomeState {
  String msg;
  PrayTimeErrorState({
    required this.msg,
  });
  // @override
  // List<Object> get props => [msg];
}

class Emittest extends HomeState {}
