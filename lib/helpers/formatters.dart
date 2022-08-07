import 'package:intl/intl.dart';
import 'package:simple_twitter/extensions/date_time_extensions.dart';

enum DateType {
  /// e.g. `22-10-2020`
  dash,

  /// e.g. `22/10/2020`
  slash,

  /// e.g. `22 Oct 2020`
  name,
}

class Formatters {
  /// Convert date time to local date e.g. `22-10-2020`. The default date type is `DateType type = DateType.dash`, which is an optional field
  static String date(DateTime dateTime, {DateType type = DateType.dash, bool isShowDayNameWithinWeek = false}) {
    final NumberFormat dateFormat = NumberFormat('00');
    final DateTime date = dateTime.toLocal();

    String formattedMonth;

    switch (type) {
      case DateType.slash:
        formattedMonth = "/${date.monthInNumber}/";
        break;
      case DateType.name:
        formattedMonth = " ${date.monthInName} ";
        break;
      default:
        formattedMonth = "-${date.monthInNumber}-";
    }

    if (isShowDayNameWithinWeek && DateTime.now().difference(date).inDays <= 7 && DateTime.now().difference(date).inHours >= 24) {
      return '${DateFormat('EEEE').format(date).toString()}, ${time(date)}';
    }

    if (isShowDayNameWithinWeek && DateTime.now().difference(date).inHours < 24 && DateTime.now().difference(date).inMinutes >= 60) {
      return '${DateTime.now().difference(date).inHours} hours ago';
    }

    if (isShowDayNameWithinWeek && DateTime.now().difference(date).inMinutes < 60 && DateTime.now().difference(date).inSeconds >= 60) {
      return '${DateTime.now().difference(date).inMinutes} minutes ago';
    }

    if (isShowDayNameWithinWeek && DateTime.now().difference(date).inSeconds < 60) {
      return 'a few seconds ago';
    }

    return '${dateFormat.format(date.day)}$formattedMonth${date.year}';
  }

  /// It takes a date and time in UTC, converts it to the local time zone, and returns the time portion of
  /// the date
  ///
  /// Args:
  ///   dateTime (DateTime): The date and time to be formatted.
  ///
  /// Returns:
  ///   The time of the dateTime object.
  static String time(DateTime dateTime) {
    final DateTime date = dateTime.toLocal();

    return date.time;
  }
}
