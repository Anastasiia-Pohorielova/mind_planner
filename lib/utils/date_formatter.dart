import 'package:intl/intl.dart';

String formatToMonthYear(DateTime time) {
  DateFormat format = DateFormat("MMMM yyyy");
  final formattedDate = format.format(time);
  return formattedDate;
}