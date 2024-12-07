import 'dart:developer';
import 'dart:io';
import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:contactcars_app_retail/core/extensions/ext_strings.dart';
import 'package:contactcars_app_retail/core/extensions/extensions.dart';
import 'package:contactcars_app_retail/core/input_formatter/cc_input_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceAmountTextField extends StatefulWidget {
  int? minAmount;
  String? hint;
  TextEditingController controller;
  final ValueChanged<int>
      onPriceValueChanged; // Callback function to update priceValue

  PriceAmountTextField({
    super.key,
    required this.controller,
    required this.onPriceValueChanged,
    this.minAmount,
    this.hint,
  });

  @override
  State<PriceAmountTextField> createState() => _PriceAmountTextFieldState();
}

class _PriceAmountTextFieldState extends State<PriceAmountTextField> {
  @override
  Widget build(BuildContext context) {
    var textFormField = TextFormField(
      textInputAction: TextInputAction.done,
      controller: widget.controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        CCCustomNumberFormatter.arabicAndEnglishNumbers,
        TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text.isEmpty) {
            return newValue; // Return newValue as it is if it's empty
          }
          if (containsArabicNumbers(newValue.text)) {
            return convertFormat(
                newValue); // If it contains Arabic numbers, don't format
          } else {
            return formatPriceInput(oldValue, newValue);
          }
        }),
      ],
      style: const TextStyle(
        fontFamily: AppFonts.ibmSemiBold,
        fontSize: 14,
        color: AppColors.colorBlue700,
      ),
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.colorBlue500Base,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.colorDarkBlue100,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        hintText: widget.hint ?? 'example_700000'.tr(),
        hintStyle: const TextStyle(
            color: AppColors.colorDarkBlue400,
            fontSize: 13,
            fontFamily: AppFonts.ibmRegular),
        fillColor: AppColors.colorWhite900,
        filled: true,
      ),
      onChanged: (value) {
        setState(() {});
        final String defaultLocale = Platform.localeName;
        if (defaultLocale == 'ar_EG') {
          widget.onPriceValueChanged(
              int.tryParse(convertArabicCommaToEnglish(value)) ?? 0);
        } else {
          widget.onPriceValueChanged(
              int.tryParse(value.replaceAll(',', '')) ?? 0);
        }
      },
    );
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: context.isArabic == true
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'price'.tr(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.ibmSemiBold,
                    color: AppColors.colorBlue700,
                  ),
                ),
              ]),
            ),
          ),
          verticalSpace(6),
          Stack(
            alignment: Alignment.center,
            children: [
              textFormField,
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'egp'.tr(),
                      style: const TextStyle(
                        fontFamily: AppFonts.ibmRegular,
                        fontSize: 13,
                        color: AppColors.colorBlue500Base,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

TextEditingValue convertFormat(TextEditingValue newValue) {
  String startNumericValue = newValue.text.replaceAll(',', '');
  startNumericValue = convertArabicNumbersToEnglish(startNumericValue);
  if (startNumericValue.isEmpty) return newValue;
  final int? value = int.tryParse(startNumericValue);

  if (startNumericValue.length > 9) return newValue;

  final NumberFormat formatter = NumberFormat('###,###');
  String newText = formatter.format(value);

  return TextEditingValue(
    text: newText,
  );
}

TextEditingValue formatPriceInput(
    TextEditingValue oldValue, TextEditingValue newValue,
    {int maxdigits = 9}) {
  // Replace commas and Arabic numerals with English ones
  String startNumericValue = newValue.text.replaceAll(',', '');
  startNumericValue = convertArabicNumbersToEnglish(startNumericValue);

  if (startNumericValue.isEmpty) return newValue;

  final int? value = int.tryParse(startNumericValue);
  if (value == null) return oldValue; // Return old value if parsing fails

  if (startNumericValue.length > maxdigits) return oldValue;

  final NumberFormat formatter = NumberFormat('###,###');
  String newText = formatter.format(value);
  int selectionIndex =
      newValue.selection.end + newText.length - startNumericValue.length;

  return TextEditingValue(
    text: newText,
    selection: TextSelection.collapsed(offset: selectionIndex),
  );
}