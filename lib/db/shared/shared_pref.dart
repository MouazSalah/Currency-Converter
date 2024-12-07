import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  // Singleton instance
  static final SharedPref _instance = SharedPref._internal();

  factory SharedPref() {
    return _instance;
  }

  SharedPref._internal();

  late SharedPreferences _sharedPreferences;

  // Constants for keys
  static const String kLangKey = 'language';
  static const String kIsOnboardingShowed = 'is_onboarding_showed';

  /// Initialize the SharedPreferences
  static Future<void> initialize() async {
    _instance._sharedPreferences = await SharedPreferences.getInstance();
  }

  // Generic getter and setter for String values
  static Future<void> setString(String key, String value) async {
    await _instance._sharedPreferences.setString(key, value);
  }

  static String? getString(String key, [String? defaultValue]) {
    return _instance._sharedPreferences.getString(key) ?? defaultValue;
  }

  static Future<void> setBoolean(String key, bool value) async {
    await _instance._sharedPreferences.setBool(key, value);
  }

  static bool? getBoolean(String key, [bool? defaultValue]) {
    return _instance._sharedPreferences.getBool(key) ?? defaultValue;
  }

  static String getLang() => getString(kLangKey, "ar") ?? "ar";
  static Future<void> setLang(String value) => setString(kLangKey, value);

  static bool isOnboardingShowed() => getBoolean(kIsOnboardingShowed, false)!;
  static Future<void> setIsOnboardingShowed(bool value) =>
      setBoolean(kIsOnboardingShowed, value);


  static Future<void> clearSharedPreferences() async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await Future.wait([
        preferences.remove(kLangKey),
        preferences.remove(kIsOnboardingShowed)
      ]);
    } catch (e, stackTrace) {
      // Log the error and stack trace to Crashlytics
      await FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }

  static Future<void> clearSharedPreferenceOfKey(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await Future.wait([
      preferences.remove(key),
    ]);
  }

  static Future<void> saveDateTime(DateTime dateTime, String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String dateString = dateTime.toIso8601String();
    await preferences.setString(key, dateString);
  }

  static Future<DateTime?> getDateTime(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? dateString = preferences.getString(key);
    if (dateString != null) {
      return DateTime.parse(dateString);
    }
    return null;
  }
}