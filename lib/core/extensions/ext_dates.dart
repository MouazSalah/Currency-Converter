import 'package:contactcars_app_retail/db/shared/shared_pref.dart';
import 'package:easy_localization/easy_localization.dart';

String getRelativeTimeDifference(DateTime? date) {
  final now = DateTime.now();
  final difference = now.difference(date ?? DateTime.now());

  if (difference.inDays > 0) {
    return '${difference.inDays} ${difference.inDays == 1 ? 'day'.tr() : 'day'.tr()}';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ${difference.inHours == 1 ? 'hour'.tr() : 'hour'.tr()}';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute'.tr() : 'minute'.tr()}';
  } else {
    return 'just_now'.tr();
  }
}

String getRemainingDaysForEndPremiumAd(DateTime? endDate) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  Duration difference = (endDate ?? DateTime.now()).difference(today);
  int daysDifference = difference.inDays;

  return "${daysDifference == 0 ? 1 : daysDifference} ${'day'.tr()}"; // return 1 if the end date is today Commented by today
}

String getRemainingDays(DateTime? date) {
  final now = DateTime.now();
  final difference = (date ?? DateTime.now()).difference(now);

  if (difference.inDays > 0) {
    return '${difference.inDays} ${difference.inDays == 1 ? 'yesterday'.tr() : 'day'.tr()}';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ${difference.inHours == 1 ? 'hour'.tr() : 'hour'.tr()}';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute'.tr() : 'minute'.tr()}';
  } else {
    return 'just_now'.tr();
  }
}

String formatHoursDuration(bool isArabic, double seconds) {
  double hours = seconds / 3600;
  return isArabic
      ? 'صالح لمدة ${hours.toInt()} ساعة'
      : 'Active for ${hours.toInt()} hour';
}

String formatDuration(double seconds) {
  if (seconds < 60) {
    return '${seconds.toInt()} seconds';
  } else if (seconds < 3600) {
    double minutes = seconds / 60;
    return '${minutes.toInt()} minutes';
  } else if (seconds < 86400) {
    double hours = seconds / 3600;
    return '${hours.toInt()} hours';
  } else {
    double days = seconds / 86400;
    return '${days.toInt()} days';
  }
}

String getRelativeTimeDifferenceForUserAds(DateTime? date) {
  final now = DateTime.now();
  final difference = now.difference(date ?? DateTime.now());

  if (difference.inDays > 0) {
    return '${difference.inDays} ${difference.inDays == 1 ? 'yesterday'.tr() : 'day'.tr()}';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ${difference.inHours == 1 ? 'hour'.tr() : 'hour'.tr()}';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute'.tr() : 'minute'.tr()}';
  } else {
    return 'just_now'.tr();
  }
}

// get diff between two dates in hours
int getDiffInHours(DateTime startDate, DateTime endDate) {
  return endDate.difference(startDate).inHours;
}

String formatDateForImageSignature(DateTime date) {
  DateFormat formatter = DateFormat('ddMMyyyyy HH:mm', 'en');
  return formatter.format(date);
}

String formatDateForLatestNews(DateTime date) {
  DateFormat formatter = DateFormat('EEEE، dd MMMM yyyy', SharedPref.getLang());
  return formatter.format(date);
}

String formatDateForListing(DateTime date) {
  DateFormat formatter = DateFormat('yyyy-MM-dd', "en");
  return formatter.format(date);
}

String getOtlobhaRemainingHours(int seconds) {
  // final now = DateTime.now();
  // final difference = (date ?? DateTime.now()).difference(now);
  double hoursDifference = (seconds / 60) / 60;
  if (hoursDifference <= 1) {
    return 'less_than_one_hour'.tr();
  } else if (hoursDifference <= 1.5) {
    return 'one_hour'.tr();
  } else if (hoursDifference <= 2) {
    return '${'less_than'.tr()} ${'two_hours'.tr()}';
  } else if (hoursDifference <= 2.5) {
    return 'two_hours'.tr();
  } else if (hoursDifference > 2.5 && hoursDifference < 10) {
    int fullHours = hoursDifference.toInt();
    double remainingMinutes = (hoursDifference - fullHours) * 60;
    if (remainingMinutes >= 30) {
      return '${fullHours + 1} ${'hours'.tr()}';
    } else {
      return '$fullHours ${'hours'.tr()}';
    }
  } else {
    int fullHours = hoursDifference.toInt();
    double remainingMinutes = (hoursDifference - fullHours) * 60;

    if (remainingMinutes >= 30) {
      return '${fullHours + 1} ${'hour'.tr()}';
    } else {
      return '$fullHours ${'hour'.tr()}';
    }
  }
}

String getOtlobhaPastHours(DateTime? date) {
  final now = DateTime.now();
  final difference = (now).difference(date ?? DateTime.now());

  int hoursDifference = difference.inHours;

  if (hoursDifference == 0) {
    return 'less_than_one_hour'.tr();
  } else if (hoursDifference == 1) {
    return 'one_hour'.tr();
  } else if (hoursDifference == 2) {
    return 'two_hours'.tr();
  } else if (hoursDifference > 2 && hoursDifference < 10) {
    return '$hoursDifference ${'hours'.tr()}';
  } else {
    return '$hoursDifference ${'hour'.tr()}';
  }
}

String formatDateWithDay(DateTime dateTime, {bool isArabic = false}) {
  String locale = isArabic ? 'ar' : 'en';
  final dayName =
      DateFormat.EEEE(locale).format(dateTime); // Full day name in Arabic
  final day = DateFormat.d(locale)
      .format(dateTime); // Day of the month in Arabic numerals
  final month =
      DateFormat.M(locale).format(dateTime); // Month in Arabic numerals
  final year = DateFormat.y(locale).format(dateTime); // Year in Arabic numerals
  return '$dayName $day - $month - $year';
}
