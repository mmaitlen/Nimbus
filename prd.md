# Product Requirements Document (PRD) for Nimbus Weather App

## 1. Overview

Nimbus is a Flutter-based mobile and desktop weather application designed to provide users with current weather information for selected locations. Users can observe weather conditions by inputting zip codes, which are then translated into City/State locations. The application prioritizes a clean architecture, robust error handling, and a user-friendly interface.

**Goal:** To deliver a performant, reliable, and intuitive weather application across Android, iOS, and macOS platforms, leveraging the National Weather Service (NWS) API for weather data.

## 2. Technical Architecture & Constraints

*   **Platform Support:** Android, iOS, macOS.
*   **Architecture:** Clean Architecture principles will be strictly followed, emphasizing separation of concerns.
*   **Programming Principles:** Adherence to SOLID principles.
*   **State Management:** BLoC (Business Logic Component) will be used, treating BLoCs as ViewModels to manage and expose UI state.
*   **Dependency Injection:** GetIt will be utilized for efficient and maintainable dependency injection.
*   **Business Logic:** Business logic will reside primarily in BLoCs and UseCases, minimizing its presence in the UI layer to facilitate headless testing.
*   **Linting and Coding Standards:** Strict adherence to the official Dart Linter, `flutter_lints`, Effective Dart guidelines, and Kotlin coding conventions (for native Android modules, if any).

## 3. Core Features (The "What" and "Why")

### 3.1 Location Management
*   **Purpose:** Allow users to define and manage a list of locations they wish to monitor.
*   **Details:**
    *   Users will add locations by entering a zip code.
    *   Zip codes will be translated to City/State and geographic coordinates (latitude/longitude) using a free geocoding service.
    *   A default location can be set by the user.

### 3.2 Weather Data Display
*   **Purpose:** Present current weather conditions for selected locations clearly and concisely.
*   **Details:** Display NWS weather icon, City and State, Temperature, Windspeed, and a description of current weather conditions.

### 3.3 NWS API Integration
*   **Purpose:** Fetch accurate and up-to-date weather information.
*   **Details:**
    *   After obtaining latitude/longitude from geocoding, the application will query the NWS API endpoint `/points/{latitude},{longitude}` to obtain grid point information (office, gridX, gridY).
    *   Subsequently, the application will query `/gridpoints/{office}/{gridX},{gridY}/forecast` to retrieve detailed weather forecasts.

### 3.4 Data Persistence
*   **Purpose:** Ensure user-added locations, default location, settings, and error logs are maintained across app sessions.
*   **Details:** `Drift` will be used as the local database solution, with a thin data access layer to interact with the database.

### 3.5 Caching Mechanism
*   **Purpose:** Improve user experience by providing data during API failures and reducing reliance on frequent API calls.
*   **Details:**
    *   Weather data will be cached locally.
    *   Users can configure the desired update frequency for weather data in the settings.
    *   The application will not perform backend tasks when not visible.
    *   Upon app restart, if the configured update duration has passed for a location, its weather data will be fetched. API calls for multiple locations will be staggered to avoid hitting NWS rate limits.
    *   **Rate Limit Documentation:** The actual documented NWS rate limits will be included in the application's documentation (`README.md`).
    *   **Priority:** Outdated cached data should be displayed over showing no data at all during API issues.

### 3.6 Error Logging and Reporting
*   **Purpose:** Provide visibility into API failures and allow users to manage historical errors.
*   **Details:**
    *   All API failures will be logged locally in the `Drift` database.
    *   A dedicated "Error List Screen" will display these logged errors.
    *   Error records will include `timestamp`, `apiEndpoint`, `statusCode`, `errorMessage`, `locationIdentifier`, and `requestParameters`.
    *   A CTA will be available on the "Error List Screen" to clear errors older than 24 hours.

## 4. User Interface (UI) & User Experience (UX)

### 4.1 Initial Application State (No Locations Added)
*   When the app launches for the first time with no saved locations, an empty state will be displayed, including a clear Call-to-Action (CTA) encouraging the user to add their first location.

### 4.2 Location Input (Zip Code)
*   **Trigger:** Tapping a `FloatingActionButton`.
*   **Interaction:** A popup will appear, prompting the user to enter a zip code.
*   **Validation:** The popup will remain visible until the entered zip code is successfully validated by the geocoding API.
*   **Invalid Input:** If a zip code is invalid, an inline message "The zipcode, XXXXX, is invalid" will be displayed within the popup, and the input field will be cleared.
*   **Cancellation:** The popup will include a cancel mechanism allowing the user to exit without adding a location.

### 4.3 Location List Screen
*   **Access:** Displayed when no default location is set, or navigated to from the Detail Screen menu.
*   **Content:**
    *   A list of all saved locations.
    *   Each list item will display: NWS weather icon, City and State, Temperature, Windspeed, Description of current weather.
*   **Interaction:**
    *   Tapping on a location in the list will navigate the user to its dedicated Detail Screen.
    *   A `FloatingActionButton` will be present to trigger the zip code input popup.

### 4.4 Location Detail Screen
*   **Access:** Displayed if a default location is set on app launch, or navigated to by tapping a location in the List Screen.
*   **Content:** Comprehensive weather information for the selected location.
*   **Interactions:**
    *   **Menu:** An AppBar menu will provide the following options:
        *   "List Screen": Navigates to the Location List Screen.
        *   "Settings": Navigates to the Settings Screen.
        *   "Make Default": Sets the current location as the user's default location.

### 4.5 Error Handling UI & Feedback

*   **Data Retrieval Indicator:** A spinner icon will be displayed in the app bar when weather data is actively being retrieved from the NWS API or geocoding service.
*   **API Failure Indicator:** If an API call fails (NWS or geocoding), a red triangle icon will appear in the app bar.
*   **Error List Screen Access:**
    *   Clicking the red triangle icon in the app bar will navigate the user to the "Error List Screen."
    *   The "Error List Screen" will also be accessible via an option in the Detail Screen's menu.
*   **Default Refresh Icon:** A default icon (e.g., a refresh icon) will be displayed in the app bar when no spinner or red triangle is active. Tapping this icon will trigger a manual refetch of weather data for the current location.
    *   If this manual refetch results in a NWS rate limit error, the red triangle will be displayed.
    *   Navigating from the Error List Screen back to a weather screen will replace the red triangle (if present) with this default refresh icon.
*   **Cached Data during Errors:** If an API call fails but cached data for the location is available, the cached data will be displayed along with a visual indicator (e.g., "Last updated: X minutes ago") and the red triangle icon in the app bar.

### 4.6 Settings Screen
*   **Access:** Via a menu option on the Detail Screen.
*   **Functionality:**
    *   User-configurable weather data update interval.
    *   Temperature unit selection (Celsius/Fahrenheit).
    *   Wind speed unit selection.

## 5. Nice-to-Have Features
*   Phase of the moon for the displayed location.
*   Sunrise and sunset times for the displayed location.

## 6. Technical Requirements

*   **Geocoding Service:** MapTiler Geocoding API (free tier) will be used for zip code to latitude/longitude translation.
*   **NWS API:** Integration with National Weather Service API for current weather conditions.
*   **Local Database:** `Drift` for all local data persistence.
*   **Dependencies:** Management via `pubspec.yaml`.
*   **Error Handling:** Robust error logging and display mechanisms as detailed in UI/UX section.

## 7. Task List

*   **Planned:**
    *   Set up Flutter project with multi-platform support (Android, iOS, macOS).
    *   Implement Clean Architecture base structure (layers, interfaces, etc.).
    *   Configure GetIt for dependency injection.
    *   Integrate Drift for local database persistence.
    *   Implement Geocoding service integration (MapTiler).
    *   Implement NWS API client and data models.
    *   Develop BLoCs and UseCases for location management and weather data retrieval.
    *   Create UI for initial empty state and zip code input popup.
    *   Develop Location List Screen.
    *   Develop Location Detail Screen.
    *   Implement AppBar menu with navigation and "Make Default" functionality.
    *   Implement Settings Screen with update interval, temperature, and wind unit selection.
    *   Develop Error List Screen and associated error logging/clearing logic.
    *   Implement UI indicators for loading, API failure, and manual refresh.
    *   Integrate caching logic for weather data.
    *   Add tests (unit, widget) for all core features and business logic.
    *   Update `README.md` with app description, usage instructions, and NWS rate limits.
*   **In Progress:**
*   **Completed:**
