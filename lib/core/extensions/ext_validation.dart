import 'package:flutter/material.dart';

bool isPriceValid(int? value, [int minAmount = 5000]) {
  return value != null && value != 0 && value >= minAmount;
}

bool isEngineCapacityValid(int? value) {
  return value != null && value != 0 && value <= 5000;
}

void scrollToField(BuildContext buildContext, GlobalKey globalKey) {
  Scrollable.ensureVisible(buildContext,
      duration:
          const Duration(milliseconds: 800), // duration for scrolling time
      alignment: .5, // 0 mean, scroll to the top, 0.5 mean, half
      curve: Curves.easeInOutCubic);
}

bool isKilometerValid(int? value) {
  return value != null && value != 0 && value >= 10;
}

bool isDownPaymentPercentageValid(int? value) {
  return value != null && value != 0 && value >= 10 && value <= 90;
}

bool isSellFormTitleValid(String? value) {
  return value != null && value.trim().isNotEmpty && value.trim().length >= 3;
}

bool isExtraInfoValid(String? value) {
  return value != null && value.trim().isNotEmpty;
}

bool isSavedSearchNameValid(String? value) {
  return value != null &&
      value.trim().isNotEmpty == true &&
      value.trim().length >= 3;
}

bool isMobileValid(String mobile) {
  if (mobile.isEmpty) {
    return false;
  } else if (mobile.length != 11) {
    return false;
  } else if (mobile.toString().startsWith("01") != true) {
    return false;
  } else {
    return true;
  }
}

bool isTitleValid(String? value) {
  return value != null && value.isNotEmpty;
}

bool isDescriptionValid(String? value) {
  return value != null && value.isNotEmpty;
}
