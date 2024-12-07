enum Environment { production, staging }

class FlavorEnvironment {
  static Environment _flavorType = Environment.staging;

  static void setCurrentEnvironment(Environment type) {
    _flavorType = type;
  }

  static Environment get currentFlavor => _flavorType;
}
