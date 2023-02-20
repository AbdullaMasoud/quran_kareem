import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/core/utils/color_manager.dart';

import 'package:musilm_app/core/wigdets/appbar.dart';
import 'package:musilm_app/features/quran_main_page/domain/entities/chapters.dart';
import 'package:musilm_app/features/surah_details/presentation/cubit/surah_details_cubit.dart';
import 'package:musilm_app/features/surah_details/presentation/widgets/surah_details_builer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              padding: EdgeInsets.zero,
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
      body: Column(
        children: [
          Stack(
            children: [
              AppBarImageBackGround(hieght: 150.h),
              Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                  left: 10.w,
                  right: 40.w,
                ),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
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
                          widget.chapter.arabicName.toString(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            "${_formatAyahString(widget.chapter.versesCount)}-",
                            style: Theme.of(context).textTheme.labelLarge),
                        Text(widget.chapter.versesCount.toString(),
                            style: Theme.of(context).textTheme.labelLarge),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          _arabicAyahPlace(widget.chapter.revelationPlace),
                          style: Theme.of(context).textTheme.labelLarge),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  _surahDetailsBloc(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _formatAyahString(int? ayah) {
  String oneDigitAyah = 'أيآت';
  String twoDigitAyah = 'أيه';
  if (ayah! <= 10) {
    return oneDigitAyah;
  } else {
    return twoDigitAyah;
  }
}

String _arabicAyahPlace(String? ayahPlace) {
  String makkah = 'مكية';
  String madinah = 'مدنية';
  if (ayahPlace == 'makkah') {
    return makkah;
  } else {
    return madinah;
  }
}
