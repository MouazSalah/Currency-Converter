import 'package:contactcars_app_retail/flavor_environment.dart';

class UrlProvider {
  static BaseUrlConfig get config {
    switch (FlavorEnvironment.currentFlavor) {
      case Environment.production:
        return ProductionUrlConfig();
      case Environment.staging:
      default:
        return StagingUrlConfig();
    }
  }
}

abstract class BaseUrlConfig {
  String get apiBaseURL;
  String get apiKey;
  String get baseImageUrl;
}

class StagingUrlConfig implements BaseUrlConfig {
  @override
  String get apiBaseURL => "https://free.currconv.com/";
  
  @override
  String get apiKey => "c11a719269f9a9ea41ea";
  @override
  String get baseImageUrl =>
      "https://flagpedia.net/data/flags/icon/72x54/";
}

class ProductionUrlConfig implements BaseUrlConfig {
  @override
  String get apiBaseURL => "https://free.currconv.com/";
  
  @override
  String get apiKey => "c11a719269f9a9ea41ea";
  @override
  String get baseImageUrl =>
      "https://flagpedia.net/data/flags/icon/72x54/";
}