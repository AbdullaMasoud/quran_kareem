import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/core/wigdets/appbar.dart';
import 'package:musilm_app/core/wigdets/loading_annimation.dart';
import 'package:musilm_app/features/azkar_details/presentation/cubit/azkar_cubit.dart';
import 'package:musilm_app/features/azkar_details/presentation/widgets/azkar_details_builder.dart';

class AzkarDetailsPage extends StatefulWidget {
  String category;
  AzkarDetailsPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<AzkarDetailsPage> createState() => _AzkarDetailsPageState();
}

class _AzkarDetailsPageState extends State<AzkarDetailsPage> {
  _getListofAzkars() {
    BlocProvider.of<AzkarCubit>(context).getAzkars(widget.category);
  }

  @override
  void initState() {
    super.initState();
    _getListofAzkars();
  }

  late PageController bordingContrller = PageController();

  Widget _azkarBlocBuilder() {
    AzkarCubit azkarCubit = AzkarCubit.get(context);
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        if (state is GetAzkarLoading) {
          return const Center(
            child: LoadingAnimation(),
          );
        } else if (state is GetAzkarError) {
          return const Center(child: Text('Error'));
        } else if (state is GetAzkarLoaded) {
          return Expanded(
            child: PageView.builder(
              controller: bordingContrller,
              itemCount: azkarCubit.azkarListByCategory.length,
              itemBuilder: ((context, index) => AzkarDetailsBuilder(
                    azkar: azkarCubit.azkarListByCategory[index],
                  )),
            ),
          );
        } else {
          return const Center(
            child: LoadingAnimation(),
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
              AppBarImageBackGround(hieght: 110.h),
              Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                  left: 10.w,
                  right: 40.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        SizedBox(
                          width: 260.w,
                          child: Text(
                            widget.category,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.headlineLarge,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          _azkarBlocBuilder(),
        ],
      ),
    );
  }
}
