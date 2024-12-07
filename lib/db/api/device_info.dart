import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<String> getAndroidDeveiceInfo() async {
  try {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    String deviceName = androidInfo.model;
    String manufacturer = androidInfo.manufacturer;
    String deviceBrand = androidInfo.brand;
    String androidVersion = androidInfo.version.release;
    int sdkVersion = androidInfo.version.sdkInt;
    String hardware = androidInfo.hardware;
    String product = androidInfo.product;
    String device = androidInfo.device;
    String display = androidInfo.display;
    String fingerprint = androidInfo.fingerprint;
    String platformName = getPlatformName();

    String deviceInfoString = "Platform Name: $platformName\n" +
        "Device Name: $deviceName\n" +
        "Manufacturer: $manufacturer\n" +
        "Device Brand: $deviceBrand\n" +
        "Android Version: $androidVersion\n" +
        "SDK Version: $sdkVersion\n" +
        "Hardware: $hardware\n" +
        "Product: $product\n" +
        "Device: $device\n" +
        "Display: $display\n" +
        "Fingerprint: $fingerprint";

    return deviceInfoString;
  } catch (e) {
    return "Failed to get device info: ${e.toString()}";
  }
}

String getPlatformName() {
  return Platform.isAndroid ? "Flutter_Android" : "Flutter_IOS";
}

Future<String> getMobileVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return "v${packageInfo.version} ${packageInfo.buildNumber}";
}

Future<String> getIOSMobileVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

Future<int> getCurrentVersionCode() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  int versionCode = int.parse(packageInfo.buildNumber);
  return versionCode;
}

Future<String> getCurrentIOSVersionCode() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String versionCode = (packageInfo.version);
  return versionCode;
}
