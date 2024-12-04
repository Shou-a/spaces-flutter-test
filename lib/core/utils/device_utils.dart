import 'package:intl/intl.dart';

class DeviceUtils {
  static formatDate(String date) {
    date = date;
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('d MMM, yyyy');
    return outputFormat.format(inputDate);
  }

  static String bookingDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    final DateFormat format = DateFormat('dd-MM-yyyy');
    final String formatted = format.format(dateTime);
    return formatted;
  }

  static String twentyFourHourFormatWithDate(String date) {
    return DateFormat('hh:mm a').format(DateTime.parse(date));
  }
}
