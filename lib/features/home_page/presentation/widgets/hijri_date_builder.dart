import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class HijriDateBuilder extends StatelessWidget {
  const HijriDateBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var today = HijriCalendar.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          today.hYear.toString(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          today.longMonthName.toString(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          today.hDay.toString(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
