import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/quran_main_page/domain/entities/chapters.dart';
import 'package:musilm_app/features/surah_details/presentation/cubit/surah_details_cubit.dart';
import 'package:musilm_app/features/surah_details/presentation/widgets/surah_details_builer.dart';

class SurahDetailsPage extends StatefulWidget {
  final Chapter chapter;
  const SurahDetailsPage({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  @override
  State<SurahDetailsPage> createState() => _SurahDetailsPageState();
}

class _SurahDetailsPageState extends State<SurahDetailsPage> {
  _getSurahDetails() {
    BlocProvider.of<SurahDetailsCubit>(context)
        .getSurahDetails(widget.chapter.id);
    // print(widget.chapter.id);
  }

  @override
  void initState() {
    super.initState();
    _getSurahDetails();
  }

  Widget _surahDetailsBloc() {
    return BlocBuilder<SurahDetailsCubit, SurahDetailsState>(
      builder: (context, state) {
        if (state is SurahDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SurahDetailsError) {
          return Center(child: Text(state.msg));
        } else if (state is SurahDetailsLoaded) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.surah.verses.length,
              itemBuilder: (BuildContext context, int index) {
                return SurahDetailsBuilder(verse: state.surah.verses[index]);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.green,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        title: Text(
          widget.chapter.arabicName.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _surahDetailsBloc(),
          ],
        ),
      ),
    );
  }
}
