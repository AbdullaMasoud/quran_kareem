import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/core/utils/const_manager.dart';
import 'package:musilm_app/core/wigdets/appbar.dart';
import 'package:musilm_app/core/wigdets/custom_icons.dart';

import 'package:musilm_app/features/quran_main_page/presentation/cubit/quran_main_page_cubit.dart';
import 'package:musilm_app/features/quran_main_page/presentation/widgets/surah_list_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuranMainPage extends StatefulWidget {
  const QuranMainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<QuranMainPage> createState() => _QuranMainPageState();
}

class _QuranMainPageState extends State<QuranMainPage> {
  _getListofChapters() {
    BlocProvider.of<QuranMainPageCubit>(context).getSurahInde();
  }

  @override
  void initState() {
    super.initState();
    _getListofChapters();
  }

  Widget _surahBlocBuilder() {
    return BlocBuilder<QuranMainPageCubit, QuranMainPageState>(
      builder: (context, state) {
        if (state is GetSurahIndexLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetSurahIndexError) {
          return const Center(child: Text('Error'));
        } else if (state is GetSurahIndexLoaded) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: state.chapters.chapters!.length,
              itemBuilder: (BuildContext context, int index) {
                return ChaptersList(
                  chapters: state.chapters.chapters![index],
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _surahIconBuilder() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        // itemCount: state.chapters.chapters!.length,
        itemBuilder: (BuildContext context, int index) {
          return const ChaptersList(
              // chapters: state.chapters.chapters![index],
              );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                AppBarImageBackGround(hieght: 190.h),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.h,
                    left: 10.w,
                    right: 40.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: ColorManager.offWhite,
                              )),
                          const Spacer(),
                          Text(
                            ConstentManager.quranKarem,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TabBar(
                          labelPadding: const EdgeInsets.all(10),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: ColorManager.offWhite,
                          labelColor: ColorManager.offWhite,
                          unselectedLabelColor: ColorManager.grey400,
                          labelStyle: Theme.of(context).textTheme.labelLarge,
                          unselectedLabelStyle:
                              Theme.of(context).textTheme.labelLarge,
                          tabs: [
                            SizedBox(
                              height: 70.h,
                              child: Tab(
                                text: "السور",
                                icon: Icon(CustomIcon.quranIcon, size: 30.r),
                              ),
                            ),
                            SizedBox(
                              height: 70.h,
                              child: Tab(
                                text: "الاجزاء",
                                icon: Icon(CustomIcon.quranIcon, size: 30.r),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TabBarView(
                  children: [
                    Column(children: [_surahBlocBuilder()]),
                    Column(children: [_surahBlocBuilder()]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// appBar: AppBar(
//           toolbarHeight: 170,
//           flexibleSpace: const AppBarImageBackGround(hieght: 250),
//           title: Text(
//             ConstentManager.quranKarem,
//             style: Theme.of(context).textTheme.headlineLarge,
//           ),
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_new,
//               color: ColorManager.offWhite,
//             ),
//           ),
//           bottom: TabBar(
//             padding: const EdgeInsets.all(30),
//             // labelPadding: const EdgeInsets.all(10),
//             indicatorSize: TabBarIndicatorSize.tab,
//             indicatorColor: ColorManager.offWhite,
//             labelColor: ColorManager.offWhite,
//             unselectedLabelColor: ColorManager.offWhite,
//             labelStyle: Theme.of(context).textTheme.labelLarge,
//             unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
//             tabs: const [
//               SizedBox(
//                 height: 100,
//                 child: Tab(
//                   text: "السور",
//                   icon: Icon(CustomIcon.quranIcon, size: 50),
//                 ),
//               ),
//               SizedBox(
//                 height: 100,
//                 child: Tab(
//                   text: "الاجزاء",
//                   icon: Icon(CustomIcon.quranIcon, size: 50),
//                 ),
//               ),
//             ],
//           ),
//         ),
