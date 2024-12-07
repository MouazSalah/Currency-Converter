#!/bin/bash

echo "Hello, ios!"

# Run the Flutter build command for iOS
# flutter build ipa --export-method ad-hoc --release --flavor staging --target lib/main_staging.dart --no-tree-shake-icons

flutter clean

flutter pub get

# Change to the iOS directory
cd ios

# Install CocoaPods dependencies
pod install

bundle exec fastlane update_plugins

bundle exec fastlane increment_version_number

flutter build ipa --export-method ad-hoc --release --flavor staging --target lib/main_staging.dart --no-tree-shake-icons

# Upload the build using Fastlane
bundle exec fastlane upload_to_app_center

cd ..

cd android
echo "Hello, android!"

bundle exec fastlane update_plugins

bundle exec fastlane upload_to_firebase