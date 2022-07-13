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
          return Expanded(
            child: ListView.builder(
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'القرآن الكريم',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.shimmer);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
                        text: "السور",
                      ),
                      Tab(
                        text: "الاجزاء",
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(children: [_surahBlocBuilder()]),
                    Column(children: [_surahBlocBuilder()]),
                  ],
                ),
              )
            ],
          ),
        ),
        //
      ),
    );
  }
}
