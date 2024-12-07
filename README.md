# Create a structured README.md file content
readme_content = """
# Currency Converter App

A Flutter-based Currency Converter application designed to demonstrate robust system architecture, clean code, and modern development practices. This app provides functionalities for currency conversion, historical exchange rate tracking, and offline storage of currency data.

---

## Features

1. **Currency List**:
   - Displays supported currencies with their country flags.
   - Caches data locally after the first API call for offline use.

2. **Historical Data**:
   - Displays exchange rates for two selected currencies over the last 7 days.

3. **Currency Converter**:
   - Allows users to convert an amount between two currencies.

---

## Technologies and Design Choices

1. **Flavors**:
   - Used to manage multiple environments (development, staging, production).
   - Enables flexibility in configuring app behavior based on the build variant.

2. **Clean Architecture**:
   - Separates the app into distinct layers: Presentation, Domain, and Data.
   - Ensures testability, scalability, and maintainability.

3. **Hive Database**:
   - Lightweight and fast local storage for offline caching of currency data.
   - Chosen for its performance and suitability for Flutter projects.

4. **Dependency Injection (GetIt)**:
   - Promotes modularity and testability by managing dependencies efficiently.
   - Centralized dependency configuration in `lookups_locator.dart`.

5. **Dio**:
   - Used for API integration with advanced error handling and HTTP interception.
   - Provides an efficient way to fetch and manage network data.

6. **Base Widgets**:
   - Custom reusable widgets for consistent design and functionality across the app.

7. **GoRouter**:
   - Implements a declarative approach to navigation, ensuring seamless and efficient page transitions.

---

## Installation and Setup

1. **Clone the Repository**:
   ```bash
   git clone <repository-link>
   cd currency_converter_app
