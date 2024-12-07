#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Print each command before executing it
set -x

# Run flutter clean
flutter clean

# Run flutter pub get
flutter pub get

# Run the Flutter app with the specified flavor and target
flutter run --flavor staging --target=lib/main_staging.dart

