part of 'user_address_cubit.dart';

abstract class UserAddressState extends Equatable {
  const UserAddressState();

  @override
  List<Object> get props => [];
}

class UserAddressInitial extends UserAddressState {}

class UserAdressLoaded extends UserAddressState {
  String userAddress;
  UserAdressLoaded({
    required this.userAddress,
  });
}
