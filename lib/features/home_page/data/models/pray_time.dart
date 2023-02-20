import 'package:musilm_app/features/home_page/domain/entities/pray_time.dart';

class DataModel extends Data {
  DataModel({required super.prayTime});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        prayTime: PrayTimeModel.fromJson(
          json["data"],
        ),
      );
}

class PrayTimeModel extends PrayTime {
  PrayTimeModel({required super.times, required super.date});
  factory PrayTimeModel.fromJson(Map<String, dynamic> json) => PrayTimeModel(
        times: TimeModel.fromJson(json["timings"]),
        date: DateModel.fromJson(
          json["date"],
        ),
      );
}

class TimeModel extends Times {
  const TimeModel(
      {required super.fajr,
      required super.sunrise,
      required super.dhuhr,
      required super.asr,
      required super.maghrib,
      required super.isha,
      required super.imsak});

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        imsak: json["Imsak"],
      );
}

class DateModel extends Date {
  const DateModel({required super.hijri});
  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
        hijri: HijriModel.fromJson(json["hijri"]),
      );
}

// class DatesModel extends Dates {
//   const DatesModel({required super.hijri});

//   factory DatesModel.fromJson(Map<String, dynamic> json) => DatesModel(
//         hijri: HijriModel.fromJson(json["hijri"]),
//       );
// }

class HijriModel extends Hijri {
  const HijriModel({required super.month, super.year, super.day});

  factory HijriModel.fromJson(Map<String, dynamic> json) => HijriModel(
        day: json["day"],
        year: json["year"],
        month: HijriMonthModel.fromJson(json["month"]),
      );
}

class HijriMonthModel extends HijriMonth {
  const HijriMonthModel({required super.monthAr, super.monthEn});

  factory HijriMonthModel.fromJson(Map<String, dynamic> json) =>
      HijriMonthModel(
        monthAr: json['ar'],
        monthEn: json['en'],
      );
}
