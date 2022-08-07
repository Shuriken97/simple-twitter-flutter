extension DateTimeExtension on DateTime {
  static final List<Map<String, dynamic>> _month = [
    {
      "number": "01",
      "name": "Jan",
    },
    {
      "number": "02",
      "name": "Feb",
    },
    {
      "number": "03",
      "name": "Mar",
    },
    {
      "number": "04",
      "name": "Apr",
    },
    {
      "number": "05",
      "name": "May",
    },
    {
      "number": "06",
      "name": "Jun",
    },
    {
      "number": "07",
      "name": "Jul",
    },
    {
      "number": "08",
      "name": "Aug",
    },
    {
      "number": "09",
      "name": "Sep",
    },
    {
      "number": "10",
      "name": "Oct",
    },
    {
      "number": "11",
      "name": "Nov",
    },
    {
      "number": "12",
      "name": "Dec",
    },
  ];

  /// This is a getter method that returns a DateTime object that is 29 days before the current date.
  DateTime get lastMonth {
    return DateTime(year, month, day - 29);
  }

  /// This is a getter method that returns the name of the month.
  String get monthInName {
    return _month[month - 1]["name"];
  }

  /// This is a getter method that returns the number of the month.
  String get monthInNumber {
    return _month[month - 1]["number"];
  }

  /// This is a getter method that returns the time in 12-hour format.
  String get time {
    final int adjustedHour = hour > 12 ? hour - 12 : hour;
    final String adjustedMinute = minute > 9 ? '$minute' : '0$minute';
    final String adjustedMeridiem = hour >= 12 ? 'PM' : 'AM';

    return '$adjustedHour:$adjustedMinute $adjustedMeridiem';
  }
}
