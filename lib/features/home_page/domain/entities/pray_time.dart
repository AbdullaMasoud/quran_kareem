import 'package:equatable/equatable.dart';

class Data extends Equatable {
  PrayTime prayTime;
  Data({
    required this.prayTime,
  });
  @override
  List<Object?> get props => [prayTime];
}

class PrayTime extends Equatable {
  Times times;
  Date date;

  PrayTime({
    required this.times,
    required this.date,
  });
  @override
  List<Object?> get props => [times, date];
}

class Times extends Equatable {
  final String? fajr;
  final String? sunrise;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;
  final String? imsak;
  const Times({
    required this.imsak,
    required this.sunrise,
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  @override
  List<Object?> get props => [fajr, sunrise, dhuhr, asr, maghrib, isha, imsak];
}

class Date extends Equatable {
  final Hijri hijri;

  const Date({
    required this.hijri,
  });

  @override
  List<Object?> get props => [hijri];
}

// class Dates extends Equatable {
//   final Hijri hijri;

//   const Dates({
//     required this.hijri,
//   });

//   @override
//   List<Object?> get props => [hijri];
// }

class Hijri extends Equatable {
  final String? day;
  final String? year;
  final HijriMonth month;

  const Hijri({
    required this.day,
    required this.year,
    required this.month,
  });

  @override
  List<Object?> get props => [day, year, month];
}

class HijriMonth extends Equatable {
  final String? monthAr;
  final String? monthEn;

  const HijriMonth({
    required this.monthAr,
    required this.monthEn,
  });

  @override
  List<Object?> get props => [monthAr, monthEn];
}
