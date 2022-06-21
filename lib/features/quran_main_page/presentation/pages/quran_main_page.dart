import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:musilm_app/config/routes/route.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/quran_main_page/presentation/cubit/quran_main_page_cubit.dart';
import 'package:musilm_app/features/quran_main_page/presentation/widgets/surah_list_builder.dart';

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
          // chapters = (state).chapters;
          return ChaptersList(chapters: state.chapters);
          // return ListView.builder(
          //   itemCount: state.chapters.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return ChaptersList(
          //       chapters: state.chapters[index],
          //     );
          //   },
          // );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, Routes.homePge);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
          ),
          title: const Text(
            'Al-Qur\'an',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
          ],
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorManager.lightWhite,
                border: Border.all(
                  width: 2,
                  color: ColorManager.lightWhite,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(18)),
              ),
              child: TabBar(
                  labelPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: ColorManager.green,
                  labelColor: ColorManager.green,
                  unselectedLabelColor: ColorManager.lightSky,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  tabs: const [
                    Tab(
                      text: "Surah",
                    ),
                    Tab(
                      text: "Juz",
                    ),
                    Tab(
                      text: "Bookmark",
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Page',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        _surahBlocBuilder(),
                      ]),
                  Column(children: [_surahBlocBuilder()]),
                  Column(children: [_surahBlocBuilder()]),
                ],
              ),
            )
          ],
        ),
        //
      ),
    );
  }
}
