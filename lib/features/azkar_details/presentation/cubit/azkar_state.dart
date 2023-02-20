part of 'azkar_cubit.dart';

abstract class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

class AzkarInitial extends AzkarState {}

class GetAzkarLoading extends AzkarState {}

class GetAzkarByCategoryLoading extends AzkarState {}

class GetAzkarLoaded extends AzkarState {
  final List<AzkarData> azkar;
  const GetAzkarLoaded({
    required this.azkar,
  });

  @override
  List<Object> get props => [azkar];
}

class GetAzkarError extends AzkarState {
  final String msg;
  const GetAzkarError({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}

class RepeatIconVisibaltyState extends AzkarState {}
