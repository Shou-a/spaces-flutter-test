import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDate(DateTime date) {
    final daySuffix = getDaySuffix(date.day);
    final formattedDate =
        DateFormat('EEEE, d\'$daySuffix\' MMMM, y').format(date);
    return formattedDate;
  }

  static String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static DateTime formatTimeFromEpoch(int epoch) {
    return DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
  }

  static int currentDateTimeToEpoch() {
    return (DateTime.now().millisecondsSinceEpoch / 1000).round();
  }
}
