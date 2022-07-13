import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/features/home/presentation/pages/home_page.dart';
import 'package:musilm_app/features/quran_main_page/presentation/pages/quran_main_page.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());

  static BottomNavigationBarCubit get(context) => BlocProvider.of(context);

  //bottomNavi

  List<Widget> bottomScreens = [
    const QuranMainPage(),
    const HomePage(),
  ];

  int currentIndex = 1;
  void changeBottomNavi(int index) {
    currentIndex = index;
    emit(TestEmit());
  }
}
