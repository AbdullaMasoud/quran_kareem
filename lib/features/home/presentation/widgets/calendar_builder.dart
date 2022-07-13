import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBuilder extends StatefulWidget {
  const CalendarBuilder({Key? key}) : super(key: key);

  @override
  State<CalendarBuilder> createState() => _CalendarBuilderState();
}

class _CalendarBuilderState extends State<CalendarBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        return Column(
          children: [
            TableCalendar(
              locale: 'ar_Ar',
              calendarFormat: CalendarFormat.week,
              startingDayOfWeek: StartingDayOfWeek.saturday,
              focusedDay: homeCubit.focusedDay,
              firstDay: DateTime(2022),
              lastDay: DateTime(2023),
              daysOfWeekHeight: 50,
              rowHeight: 70,
              weekendDays: const [DateTime.friday, DateTime.saturday],
              onDaySelected: (selectedDays, focusedDays) {
                homeCubit.changeDaySelected(selectedDays, focusedDays);
              },
              selectedDayPredicate: (day) {
                return isSameDay(homeCubit.selectedDay, day);
              },
              calendarStyle: _calendarStyle(),
              daysOfWeekStyle: _daysOfWeekStyle(),
              headerStyle: _headerStyle(),
            ),
          ],
        );
      },
    );
  }

  CalendarStyle _calendarStyle() => CalendarStyle(
        isTodayHighlighted: true,
        todayDecoration:
            BoxDecoration(color: ColorManager.lightSky, shape: BoxShape.circle),
        todayTextStyle: TextStyle(fontSize: 18, color: ColorManager.offWhite),
        selectedDecoration:
            BoxDecoration(shape: BoxShape.circle, color: ColorManager.orange),
        selectedTextStyle:
            TextStyle(fontSize: 18, color: ColorManager.offWhite),
        defaultTextStyle: const TextStyle(fontSize: 18),
        weekendTextStyle: const TextStyle(fontSize: 18),
      );

  DaysOfWeekStyle _daysOfWeekStyle() => DaysOfWeekStyle(
        weekdayStyle: TextStyle(
            fontSize: 14,
            color: ColorManager.green,
            fontWeight: FontWeight.bold),
        weekendStyle: TextStyle(
            fontSize: 14,
            color: ColorManager.lightSky,
            fontWeight: FontWeight.bold),
      );

  HeaderStyle _headerStyle() => HeaderStyle(
      titleCentered: true,
      formatButtonVisible: false,
      titleTextStyle: TextStyle(
        color: ColorManager.lightSky,
        fontSize: 18,
      ));
}
