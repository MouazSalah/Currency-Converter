import 'package:easy_localization/easy_localization.dart';
import 'package:contactcars_app_retail/db/shared/shared_pref.dart';

List<int> convertStringToList(String? ids) {
  if (ids == null || ids.isEmpty) return [];
  List<String> integerStrings =
      ids.replaceAll(RegExp('[^0-9,]'), '').split(',');
  integerStrings = integerStrings.where((str) => str.isNotEmpty).toList();
  return integerStrings.map((str) => int.parse(str)).toList();
}

// List<int> convertStringToList(String? ids) {
//   if(ids == null) return [];
//   List<String> integerStrings = ids.replaceAll(RegExp('[^0-9,]'), '').split(',');
//   return integerStrings.map((str) => int.parse(str)).toList();
// }

bool containsArabicNumbers(String inputString) {
  RegExp arabicPattern = RegExp(r'[\u0660-\u0669]+');
  return arabicPattern.hasMatch(inputString);
}

String convertArabicNumbersToEnglish(String input) {
  const arabicNumbers = '٠١٢٣٤٥٦٧٨٩';
  const englishNumbers = '0123456789';

  // Replace each Arabic digit with the corresponding English digit
  for (int i = 0; i < arabicNumbers.length; i++) {
    input = input.replaceAll(arabicNumbers[i], englishNumbers[i]);
  }
  return input;
}

String convertArabicCommaToEnglish(String value) {
  final arabicCommaCode = 0x066C; // Unicode code point for Arabic comma
  return String.fromCharCodes(
      value.codeUnits.where((code) => code != arabicCommaCode));
}

String getStandardSearchQuery(String keyString) {
  return keyString
      .toLowerCase()
      .replaceAll("أ", "ا")
      .replaceAll("إ", "ا")
      .replaceAll("آ", "ا")
      .replaceAll("ء", "ا")
      .replaceAll("ت", "ه")
      .replaceAll("ة", "ه")
      .replaceAll("ي", "ي")
      .replaceAll("ئ", "ي")
      .replaceAll("ى", "ي")
      .replaceAll("ز", "ذ")
      .replaceAll("ch", "sh")
      .replaceAll("k", "q")
      .replaceAll("e", "i")
      .replaceAll("g", "j");
}

String formatMyDate(DateTime? date) {
  final utcDate = DateTime.parse(date.toString());
  final localDate = utcDate.toLocal();

  var arDateFormat = DateFormat('dd MMMM - hh:mm \u0061', SharedPref.getLang());

  var formattedDate = arDateFormat
      .format(localDate)
      .replaceAllMapped(RegExp('[٠١٢٣٤٥٦٧٨٩]'), (match) {
    var arabicNumbers = '٠١٢٣٤٥٦٧٨٩';
    var index = arabicNumbers.indexOf(match.group(0)!);
    return index.toString();
  });

  return formattedDate;
}

String? formatExpiryDateForBundles(DateTime? date) {
  if (date == null) {
    return null;
  }

  try {
    final utcDate = DateTime.parse(date.toString());
    final localDate = utcDate.toLocal();

    var arDateFormat =
        DateFormat(SharedPref.getLang() == "ar" ? 'yyyy/MM/dd' : 'dd/MM/yyyy');

    var formattedDate = arDateFormat
        .format(localDate)
        .replaceAllMapped(RegExp('[٠١٢٣٤٥٦٧٨٩]'), (match) {
      var arabicNumbers = '٠١٢٣٤٥٦٧٨٩';
      var index = arabicNumbers.indexOf(match.group(0)!);
      return index.toString();
    });

    return formattedDate;
  } catch (e) {
    return null;
  }
}

String formatExpiryDateForProfile(DateTime? date) {
  final utcDate = DateTime.parse(date.toString());
  final localDate = utcDate.toLocal();

  var arDateFormat = DateFormat(
      SharedPref.getLang() == "ar" ? 'dd MMM yyyy' : 'dd MMM yyyy',
      SharedPref.getLang());

  var formattedDate = arDateFormat
      .format(localDate)
      .replaceAllMapped(RegExp('[٠١٢٣٤٥٦٧٨٩]'), (match) {
    var arabicNumbers = '٠١٢٣٤٥٦٧٨٩';
    var index = arabicNumbers.indexOf(match.group(0)!);
    return index.toString();
  });

  return formattedDate;
}

String formatNumberWithCommas(dynamic number) {
  try {
    if (number == number.toInt()) {
      return NumberFormat('#,###', 'en_US').format(number);
    } else {
      return NumberFormat('#,##0.00', 'en_US').format(number);
    }
  } catch (error) {
    return "";
  }
}

String calculateDateAfterDays(int numberOfDays) {
  final now = DateTime.now();
  final newDate = now.add(Duration(days: numberOfDays));
  final formattedDate =
      DateFormat(SharedPref.getLang() == "ar" ? 'yyyy/MM/dd' : 'dd/MM/yyyy')
          .format(newDate);
  return formattedDate;
}

String calculateDateYMD(DateTime dateTime) {
  final formattedDate =
      DateFormat(SharedPref.getLang() == "ar" ? 'yyyy/MM/dd' : 'dd/MM/yyyy')
          .format(dateTime);
  return formattedDate;
}

bool isCodeExpired(DateTime givenDateTime) {
  DateTime now = DateTime.now().toUtc();

  // Comparing year, month, day, hour, and minute
  if (givenDateTime.year < now.year ||
      (givenDateTime.year == now.year && givenDateTime.month < now.month) ||
      (givenDateTime.year == now.year &&
          givenDateTime.month == now.month &&
          givenDateTime.day < now.day) ||
      (givenDateTime.year == now.year &&
          givenDateTime.month == now.month &&
          givenDateTime.day == now.day &&
          givenDateTime.hour < now.hour) ||
      (givenDateTime.year == now.year &&
          givenDateTime.month == now.month &&
          givenDateTime.day == now.day &&
          givenDateTime.hour == now.hour &&
          givenDateTime.minute < now.minute)) {
    return true;
  } else if (givenDateTime.year == now.year &&
      givenDateTime.month == now.month &&
      givenDateTime.day == now.day &&
      givenDateTime.hour == now.hour &&
      givenDateTime.minute == now.minute) {
    return false;
  } else {
    return false;
  }
}
