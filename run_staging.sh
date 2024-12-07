#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Print each command before executing it
set -x

# Run the Flutter app with the specified flavor and target
flutter run --flavor staging --target=lib/main_staging.dart