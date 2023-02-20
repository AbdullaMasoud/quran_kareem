import 'package:intl/intl.dart';

class TimeFormat {
  static DateTime parseTime(String timeString) {
    return DateFormat("yyyy-MM-dd hh:mm").parse(timeString);
  }
}
