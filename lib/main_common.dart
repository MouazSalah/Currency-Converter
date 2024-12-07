import 'package:contactcars_app_retail/currency_app.dart';
import 'package:contactcars_app_retail/db/hive/hive_adapters.dart';
import 'package:contactcars_app_retail/db/shared/shared_pref.dart';
import 'package:contactcars_app_retail/di/lookups_locator.dart';
import 'package:contactcars_app_retail/flavor_environment.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

void launchApp(Environment launchEnvironment) async {
  FlavorEnvironment.setCurrentEnvironment(launchEnvironment);

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initialize();
  initDI();
  await Hive.initFlutter();
  registerHiveAdapters();

  await EasyLocalization.ensureInitialized();
  EasyLoading.init();

  try {
    await MobileAds.instance.initialize();
  } catch (error) {
    // Handle the error
  }

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('ar'),
    ],
    path: 'assets/translation',
    startLocale: Locale(SharedPref.getLang()),
    useOnlyLangCode: true,
    child: const CurrencyConverterApp(),
  ));
}

void initDI() {
  initLookupsDI();
}
