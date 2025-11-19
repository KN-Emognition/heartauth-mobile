# HeartAuth Mobile App

The HeartAuth Mobile App is the link between the user's physical ecg/ppg scanning device and the
HeartAuth backend services. It allows users to authenticate themselves using biometric data
collected from their devices.

## Prerequisites

### Building:

- Flutter SDK
- Dart SDK
- A compatible IDE (e.g., Android Studio, VS Code)

### Running:

- An Android or iOS device/emulator
- HeartAuth backend services running and accessible
- Network connectivity
- A valid HeartAuth account
- A supported ecg/ppg scanning device (Samsung Galaxy Watch 4 or later running WearOS with our
  custom HeartAuth watch app installed)

## Building the App
### 1. Clone the repository:
   ```bash
   git clone https://github.com/KN-Emognition/heartauth-mobile.git
   cd heartauth-mobile
   ```
### 2. Install dependencies:
   ```bash
    flutter pub get
    ```
### 3. Configure environment variables:
   #### Option A: create it yourself
   - Create a `.env` file in the root director.
   - Add a `API_URL` variable with the URL of your HeartAuth backend services.
   - Add a `DEV_MODE` variable to enable hidden features, such as the watch debug screen.
   #### Option B: copy the example file
   ```bash
   cp .env.example .env
   ```
### 4. Build the app:
- For Android:
   ```bash
   flutter build apk
   ```
- For iOS:
   ```bash
    flutter build ios
    ```
