# Weather-App

# Clima

Clima is a weather app for iOS that allows users to check the current weather conditions for any city worldwide.

## Files Description:

### 1. Weather Data

**File Name:** `weatherData.swift`  
**Purpose:** This file contains the `WeatherData` struct, which represents the decoded weather data obtained from the OpenWeatherMap API. It includes the name of the city, main weather details (temperature and humidity), and an array of weather descriptions.

### 2. Weather Manager

**File Name:** `Model.swift`  
**Purpose:** This file includes the `WeatherManager` struct responsible for fetching weather data from the OpenWeatherMap API. It conforms to the `WeatherManagerDelegate` protocol to handle weather data updates. It also includes functions for performing URL requests, parsing JSON data, and updating weather information.

### 3. Weather Model

**File Name:** `WeatherModel.swift`  
**Purpose:** The `WeatherModel` struct is defined in this file. It represents the weather model with properties such as condition ID, city name, temperature, and methods to format temperature and determine weather conditions based on condition IDs.

### 4. View Controller

**File Name:** `ViewController.swift`  
**Purpose:** This file contains the main view controller (`WeatherViewController`) of the Clima app. It includes UI elements such as labels and text fields for displaying weather information and searching for cities. It conforms to `UITextFieldDelegate` and `WeatherManagerDelegate` protocols to handle user input and weather data updates, respectively. 

## Reminder:

Don't forget to customize the app by editing the following:
- Update the API key in `WeatherManager.swift` with your own OpenWeatherMap API key.
- Customize the UI, such as colors, fonts, and layout, to match your app's design.
- Feel free to add additional features or functionalities to enhance the app's user experience.
