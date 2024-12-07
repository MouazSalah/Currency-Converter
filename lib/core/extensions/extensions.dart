import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

double calculateHeightFromWidth(
    BuildContext context, double aspectRatioHeight, double aspectRatioWidth) {
  final screenWidth = MediaQuery.of(context).size.width;
  final height = screenWidth * aspectRatioHeight / aspectRatioWidth;
  return height;
}

launchURL(String URL) async {
  final Uri url = Uri.parse(URL);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

SizedBox verticalSpace(double height) => SizedBox(
      height: height,
    );

SizedBox horizontalSpace(double width) => SizedBox(
      width: width,
    );

void printResponse(String text) {
  if (kDebugMode) {
    print('\x1B[33m$text\x1B[0m');
  }
}

void printError(String text) {
  if (kDebugMode) {
    print('\x1B[31m$text\x1B[0m');
  }
}

void printTest(String text) {
  if (kDebugMode) {
    print('\x1B[32m$text\x1B[0m');
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    throw 'Could not launch $launchUri';
  }
}

extension LoadingExtension on bool {
  void handleLoading() {
    if (this) {
      EasyLoading.instance.userInteractions = false;
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
  }
}

extension ContextExtensions on BuildContext {
  void get changeLanguage {
    if (locale.toString() == "en") {
      setLocale(const Locale("ar"));
    } else {
      setLocale(const Locale("en"));
    }
  }

  bool get isArabic => locale.toString() != "en";

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnack(
      String title) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          title,
          style: const TextStyle(fontFamily: AppFonts.ibmBold),
        ),
      ),
    );
  }
}
