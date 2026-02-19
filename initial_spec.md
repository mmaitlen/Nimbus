1. Overview
Nimbus is a Flutter weather application.  The user is able to observe weather of chosen locations via a zipcode.

2. Architecture
- Use a Clean architecture layout
- Keep SOLID programming principles in mind
- State management through BLoC thinking of BLoCs as ViewModels
- GetIt for dependency injection
- Keep as much business logic out of the UI layer as possible, either move it to the BLoC or UseCases to make it easier to write headless tests

3. Test
- Write widget were appropriate but try to keep testing as much as possible in the ViewModels and above utilizing headless testing

4. Functionality
- Nimbus should maintain a list of locations, obtained from the user initially as zipcodes, but they should be translated to City/State locations.
- A default location is defined by the user
- The National Weather Service API will be used to collect current weather information for each location

5. User Interface
- If the default location is not defined, a list of locations is displayed with a FloatingActionButton to collect more zipcodes from the user.
- The list of locations will display the following
    - An icon depicting the current weather, preferably the one from the NWS 
    - City and State
    - Temperature
    - Windspeed
    - Description of the current weather conditions
- If a default location is defined, a detailed screen is displayed for just that location with all the information available for the weather conditions of the location.
- The detail screen has a CTA that allows the user to move to the list screen
- Clicking on a location in the list screen will take the user to the detail screen for that location
- The detail screen contains a CTA allowing it to take the place of the default location

6. Nice to haves
- Phase of the moon
- Sunrise and sunset times for the location