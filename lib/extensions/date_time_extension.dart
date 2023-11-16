import 'package:intl/intl.dart';

extension DateTimeNullExtension on DateTime? {
  DateTime? clearTime() {
    if (this == null) {
      return null;
    }
    return DateTime(this!.year, this!.month, this!.day, 0, 0, 0, 0, 0);
  }

  bool isSame(DateTime? other) {
    if (this == null && other == null) return true;
    if (this == null || other == null) return false;
    return this!.year == other.year && this!.month == other.month && this!.day == other.day;
  }

  String format({String? s = 'dd MMM y'}) {
    if (this == null) {
      return '';
    }
    return DateFormat(s).format(this!).toString();
  }

  String formatWithTime({String? s = 'd MMM y  HH:mm:ss'}) {
    if (this == null) {
      return '';
    }
    return DateFormat(s).format(this!).toString();
  }

  String formatWithTimeWithoutSeconds({String? s = 'd MMM y  HH:mm'}) {
    if (this == null) {
      return '';
    }
    return DateFormat(s).format(this!).toString();
  }

  String numberOfDays() {
    if (this != null) {
      final now = DateTime.now();
      if (this!.year == now.year && this!.month == now.month) {
        if (this!.day < now.day) {
          var total = now.day - this!.day;
          if (total == 1) {
            return 'Yesterday';
          } else if (total > 1 && total < 7) {
            return '$total days ago';
          } else if (total == 7) {
            return 'A week ago';
          } else if (total > 7 && total < 14) {
            return '$total days ago';
          } else if (total == 14) {
            return 'Fortnight';
          }
        } else if (this!.day > now.day) {
        } else if (this!.day == now.day) {}
      }
    }
    return '';
  }
}
