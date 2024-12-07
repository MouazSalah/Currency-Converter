import 'package:flutter/services.dart';

class VersionInfo {
  static const platform = MethodChannel('com.yourapp/version_info');

  static Future<String> get versionCode async {
    final String versionCode = await platform.invokeMethod('getVersionCode');
    return versionCode;
  }

  static Future<String> get versionName async {
    final String versionName = await platform.invokeMethod('getVersionName');
    return versionName;
  }
}
