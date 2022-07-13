import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/features/bottom_navigation_bar/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:musilm_app/features/bottom_navigation_bar/presentation/widgets/custom_icon.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        var homeCubit = BottomNavigationBarCubit.get(context);

        return Scaffold(
          extendBody: true,
          body: homeCubit.bottomScreens[homeCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              homeCubit.changeBottomNavi(index);
            },
            currentIndex: homeCubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CustomIcon.quranIcon), label: 'القرآن الكريم'),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcon.prayTimeIcon), label: 'أوقات الصلاة'),
            ],
          ),
        );
      },
    );
  }
}
