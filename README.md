
# Flutter E-commerce Application

## Project Overview

This project is a simple Flutter e-commerce application designed to showcase products from a remote API (Fake Store API), implement state management using **GetX**, and support offline caching using a local database (**SQFLite**). The app includes a product list, shopping cart, order confirmation, and follows **Test-Driven Development (TDD)** principles to ensure code reliability.

The app adheres to **Clean Architecture**, **SOLID principles**, and **OOP principles** for scalable and maintainable development.

---

## Features
- **Product List**: Fetches and displays products from the Fake Store API.
- **Shopping Cart**: Allows users to add/remove items and view the total.
- **Order Confirmation**: Proceeds to the checkout process.
- **Offline Caching**: Supports local caching of product data for offline use.
- **TDD Development**: Ensures reliability with unit and widget testing.
- **Search & Filter(by category)**: Filters and searches products in the list.
---

## How to Run

### Prerequisites

- Ensure you have **Flutter** installed. You can install Flutter following [Flutter's installation guide](https://docs.flutter.dev/get-started/install).
- Make sure the Flutter SDK is set to version `3.24.3`.

### Steps to Run the Application

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-repo-url.git
   cd your-project-directory
   ```

2. **Install the dependencies:**
   ```bash
   flutter pub get
   ```

3. **Generate the JSON serialization code:**
   Since we use `json_serializable` for serializing API responses, you must run the following command to generate the necessary files:
   ```bash
   flutter pub run build_runner build
   ```

4. **Run the app:**
   To run the app on an emulator or a physical device:
   ```bash
   flutter run
   ```

5. **Run the tests:**
   To run the unit and widget tests:
   ```bash
   flutter test
   ```

---

## Packages and Their Usage

### 1. flutter
- **Version:** `sdk: flutter`
- **Purpose:** Core framework for building the mobile application.

### 2. cupertino_icons
- **Version:** `^1.0.2`
- **Purpose:** Provides a set of iOS-style icons for use in your Flutter app.

### 3. get
- **Version:** `^4.6.6`
- **Purpose:** A lightweight and powerful state management library that also handles dependency injection and navigation in the application.
- **Usage:** Manages state, updates UI reactively, and simplifies navigation across screens.

### 4. lottie
- **Version:** `^3.1.3`
- **Purpose:** For adding smooth, scalable vector animations (e.g., loading animations) from Lottie files.

### 5. http
- **Version:** `^1.2.2`
- **Purpose:** A client library for making HTTP requests.
- **Usage:** Used to fetch product data from the Fake Store API.

### 6. sqflite
- **Version:** `^2.4.0`
- **Purpose:** Provides a SQLite database for local offline storage and caching.
- **Usage:** Used for caching product data when offline.

### 7. path_provider
- **Version:** `^2.1.4`
- **Purpose:** A Flutter plugin for accessing commonly used locations on the filesystem, such as temporary directories or app directories.
- **Usage:** Helps manage the database file locations.

### 8. json_annotation
- **Version:** `^4.9.0`
- **Purpose:** Used for annotating data models for JSON serialization/deserialization.
- **Usage:** Works with `json_serializable` to convert JSON data from the API into Dart objects.

### 9. flutter_screenutil
- **Version:** `^5.9.3`
- **Purpose:** Helps in achieving responsive designs across different screen sizes by allowing scaling of widget dimensions.
- **Usage:** Ensures the UI is responsive across devices with different screen sizes.

### 10. connectivity_plus
- **Version:** `^6.1.0`
- **Purpose:** Provides information about the network connectivity status (whether connected to the internet).
- **Usage:** Checks if the device is connected to the internet before making API requests.

### 11. flutter_rating
- **Version:** `^2.0.2`
- **Purpose:** Provides a widget for displaying and selecting star ratings.
- **Usage:** Shows product ratings in the product details screen.

---

## Development Dependencies

### 1. flutter_test
- **Version:** `sdk: flutter`
- **Purpose:** A package for writing unit and widget tests in Flutter.

### 2. flutter_lints
- **Version:** `^2.0.0`
- **Purpose:** Provides a set of recommended lints to ensure code quality and best practices.

### 3. json_serializable
- **Version:** `^6.8.0`
- **Purpose:** Works with `json_annotation` to generate the serialization boilerplate automatically.
- **Usage:** Converts JSON API responses into Dart objects and vice versa.

### 4. build_runner
- **Version:** `^2.4.13`
- **Purpose:** A package for generating code based on annotations like `json_serializable`.
- **Usage:** Automatically generates the required serialization code when using `json_serializable`.

### 5. mockito
- **Version:** `^5.4.4`
- **Purpose:** A Dart package for creating mock objects in unit and widget tests.
- **Usage:** Used to mock classes and dependencies for test cases, like simulating API responses.

### 6. test
- **Version:** `^1.25.7`
- **Purpose:** A framework for writing general Dart tests.
- **Usage:** Helps in writing unit tests for the business logic and other non-UI functionality.

### 7. get_test
- **Version:** `^4.0.1`
- **Purpose:** A testing package for the GetX framework.
- **Usage:** Simplifies testing of GetX controllers and dependency injections.

---

## Folder Structure

The project follows a **clean architecture** structure:

```
/lib
│
├── core
│   ├── utils
│   ├── error
│   
├── data
│   ├── models
│   ├── repositories
|.  |-- remote_data_source
│   └── local_data_source
├── domain
│   |
│   └── usecases
├── presentation
│   ├── bindings
│   ├── controllers
│   ├── pages
│   └── widgets
└── main.dart

/test
│
├── unit
│   ├── add_to_cart
│   ├── remove_from_cart
│   └── update_cart_item
├── widget
│   ├── category_item_widget
│   └── custom_app_bar_widget


```

---

## Conclusion

This project demonstrates how to build a scalable Flutter e-commerce application with a clean architecture, leveraging modern libraries like **GetX** for state management, **TDD** for robust development, and **SQFLite** for offline capabilities.

