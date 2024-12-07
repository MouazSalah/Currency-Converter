Currency Converter App
A Flutter-based Currency Converter application designed to demonstrate robust system architecture, clean code, and modern development practices. This app provides functionalities for currency conversion, historical exchange rate tracking, and offline storage of currency data.

Features
Currency List:

Displays supported currencies with their country flags.
Caches data locally after the first API call for offline use.
Historical Data:

Displays exchange rates for two selected currencies over the last 7 days.
Currency Converter:

Allows users to convert an amount between two currencies.
Technologies and Design Choices
Flavors:

Used to manage multiple environments (development, staging, production).
Enables flexibility in configuring app behavior based on the build variant.
Clean Architecture:

Separates the app into distinct layers: Presentation, Domain, and Data.
Ensures testability, scalability, and maintainability.
Hive Database:

Lightweight and fast local storage for offline caching of currency data.
Chosen for its performance and suitability for Flutter projects.
Dependency Injection (GetIt):

Promotes modularity and testability by managing dependencies efficiently.
Centralized dependency configuration in lookups_locator.dart.
Dio:

Used for API integration with advanced error handling and HTTP interception.
Provides an efficient way to fetch and manage network data.
Base Widgets:

Custom reusable widgets for consistent design and functionality across the app.
GoRouter:

Implements a declarative approach to navigation, ensuring seamless and efficient page transitions.
