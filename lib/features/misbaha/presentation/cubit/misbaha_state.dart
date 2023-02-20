part of 'misbaha_cubit.dart';

abstract class MisbahaState extends Equatable {
  const MisbahaState();

  @override
  List<Object> get props => [];
}

class MisbahaInitial extends MisbahaState {}

class SibhaButtonOpenState extends MisbahaState {}

class SibhaButtonCloseState extends MisbahaState {}

class SibhaRested extends MisbahaState {}
