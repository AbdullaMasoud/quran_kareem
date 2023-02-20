import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:musilm_app/features/misbaha/presentation/cubit/misbaha_cubit.dart';

class MisbahaCounter extends StatelessWidget {
  String misbhaZekr;
  MisbahaCounter({
    Key? key,
    required this.misbhaZekr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MisbahaCubit, MisbahaState>(
      builder: (context, state) {
        MisbahaCubit misbahaCubit = MisbahaCubit.get(context);

        return Column(
          children: [
            Text(
              misbhaZekr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              misbahaCubit.misbahaCircelCounter.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              misbahaCubit.misbahaButtonCounter.toString(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        );
      },
    );
  }
}
