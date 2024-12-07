import 'package:flutter/services.dart';

class CCCustomNumberFormatter extends TextInputFormatter {
  // A [TextInputFormatter] that allows only digits [0-9] and Arabic digits [٠-٩].
  static final TextInputFormatter arabicAndEnglishNumbers = 
      FilteringTextInputFormatter.allow(RegExp(r'[0-9٠-٩]'));

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Use the static formatter to filter the input
    final filteredValue = arabicAndEnglishNumbers.formatEditUpdate(oldValue, newValue);

    // Return the filtered value
    return filteredValue;
  }
}
