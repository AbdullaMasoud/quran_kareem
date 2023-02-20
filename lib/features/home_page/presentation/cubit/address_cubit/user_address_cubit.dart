import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:musilm_app/features/home_page/presentation/widgets/location_helper.dart';

part 'user_address_state.dart';

class UserAddressCubit extends Cubit<UserAddressState> {
  UserAddressCubit() : super(UserAddressInitial());

  // String userAdress = '';
  Future<void> getUserAddress() async {
    Position userLocation = await GetUserLocation.getCurrentPosition();
    String userAdress =
        await GetUserLocation.getAddressFromLatLng(userLocation);
    emit(UserAdressLoaded(userAddress: userAdress));
    // return userAdress;
  }
}
