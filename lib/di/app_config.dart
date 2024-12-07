class AppConfig {
  static bool isProduction = false; // Default to false

  // Call this method at the start of your app based on the flavor
  static void configure(bool production) {
    AppConfig.isProduction = production;
  }
}
