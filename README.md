# Laza Shop - Flutter Device Features Mini Project

This repository extends the existing Laza Shop Firebase application to integrate multiple native device features, serving as the submission for the **Flutter Device Features — Mini Project**.

## Overview
This project adds native hardware capabilities cleanly without disturbing the existing core E-commerce and Firebase Authentication functionality. The new features are gated behind a secure Profile dashboard accessed via biometric authentication.

## Implemented Features
* **Phase 1 (Device Info):** Fetches runtime hardware model and OS version using `device_info_plus`.
* **Phase 2 (Media Access):** Provides a multi-image picker gallery using `image_picker`.
* **Phase 3 (Google Maps):** Renders a Google Map centered on Cairo, Egypt with a custom marker using `google_maps_flutter`.
* **Phase 4 (Biometric Auth):** Uses `local_auth` to protect the Profile Screen. Users must authenticate with Fingerprint/PIN to access device features. (Profile defaults to `mahmoud khalaf` / `mody@gmail.com` if Firebase Auth data is missing).
* **Phase 5 (Audio Recorder):** Allows recording and playback of local audio files using `record` and `audioplayers`.

## Packages Used
* `device_info_plus`: ^13.3.0
* `image_picker`: ^1.2.4
* `google_maps_flutter`: ^2.18.2
* `local_auth`: ^3.0.2
* `record`: ^7.1.1
* `audioplayers`: ^6.8.1
* `path_provider`: ^2.1.6

## Permissions Required & Configured
The following permissions are configured in `android/app/src/main/AndroidManifest.xml`:
* `android.permission.INTERNET` - Required for Google Maps and Firebase.
* `android.permission.USE_BIOMETRIC` - Required for `local_auth` fingerprint scanning.
* `android.permission.RECORD_AUDIO` - Required by the `record` package to access the microphone.
* `android.permission.ACCESS_FINE_LOCATION` & `ACCESS_COARSE_LOCATION` - Recommended for proper maps functionality.
* `android:usesCleartextTraffic="true"` - Enabled to allow product network images to load natively without SSL issues.

## Google Maps API Key Configuration (Local Secure Setup)
To protect API keys, this project uses the **Secrets Gradle Plugin for Android**. The API key is **NOT** tracked in source control.

To run the Google Maps feature on your local machine, follow these steps:
1. Ensure your Google Cloud Project has the **Maps SDK for Android** enabled and billing is active.
2. In the root of the Android module (`android/local.properties`), add your API key like so:
   ```properties
   MAPS_API_KEY=AIzaSyYourActualApiKeyHere...
   ```
3. The app is configured to read this via the Secrets plugin and inject it into the `AndroidManifest.xml` safely at build time. 

## Testing Instructions
1. Run `flutter pub get`.
2. Connect a physical Android device or emulator. Ensure the emulator has a PIN or Fingerprint configured in the Android Security settings.
3. Run the app: `flutter run`.
4. Log into the shopping app (or create a new account).
5. On the top right of the Home Screen, tap the **Profile Icon**.
6. Complete the Biometric/PIN prompt.
7. You are now on the Profile Screen. Tap through the list items to test Device Info, Gallery, Maps, and Audio capabilities.

---

## App Screenshots

Here is a showcase of the app and its newly implemented device features:

<p align="center">
  <img src="screenshots/1.png" width="200" style="margin: 5px"/>
  <img src="screenshots/2.png" width="200" style="margin: 5px"/>
  <img src="screenshots/3.png" width="200" style="margin: 5px"/>
  <img src="screenshots/3a.png" width="200" style="margin: 5px"/>
  <img src="screenshots/4.png" width="200" style="margin: 5px"/>
  <img src="screenshots/5.png" width="200" style="margin: 5px"/>
  <img src="screenshots/6.png" width="200" style="margin: 5px"/>
  <img src="screenshots/7.png" width="200" style="margin: 5px"/>
  <img src="screenshots/8.png" width="200" style="margin: 5px"/>
  <img src="screenshots/9.png" width="200" style="margin: 5px"/>
  <img src="screenshots/10.png" width="200" style="margin: 5px"/>
  <img src="screenshots/11.png" width="200" style="margin: 5px"/>
  <img src="screenshots/12.png" width="200" style="margin: 5px"/>
  <img src="screenshots/13.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/14.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/15.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/16.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/17.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/18.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/19.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/20.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/21.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/22.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/23.jpg" width="200" style="margin: 5px"/>
  <img src="screenshots/24.jpg" width="200" style="margin: 5px"/>
</p>
