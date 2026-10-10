# Flutter Device Features Mini Project Implementation Plan

This document details the exact modifications required to integrate the Device Features Mini Project into your existing `laza_shop_firebase_app` while maintaining the core shopping capabilities and following your specific instructions (Material 3 UI, mahmoud khalaf profile details, existing map key config).

## Goal Description

Extend the existing Flutter shopping app to include 5 specific device features: Device Info, Image Picker, Google Maps, Biometric Authentication, and Audio Recording/Playback. Navigation to these features will exist inside a new protected Profile Screen, accessed from the Home Screen via Biometric Authentication.

## User Review Required

- **Biometric Security:** Access to the new `ProfileScreen` is guarded by `local_auth`. A user must authenticate using the device's fingerprint/pin to see the profile and access the hardware features.
- **Profile Details:** As requested in your prompt snippet, the fallback details for the profile if Firebase does not have them will be Name: "mahmoud khalaf", Email: "mody@gmail.com".

## Proposed Changes

---

### App Level Configurations

Updates to the `AndroidManifest.xml` for permissions and `MainActivity.kt` for `FlutterFragmentActivity` compatibility (required for Biometric Auth).

#### [MODIFY] [AndroidManifest.xml](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/android/app/src/main/AndroidManifest.xml)
- Add `<uses-permission android:name="android.permission.USE_BIOMETRIC"/>`
- Add `<uses-permission android:name="android.permission.RECORD_AUDIO"/>`
- Add `<uses-permission android:name="android.permission.INTERNET"/>` (For maps and firebase, usually already there, but ensuring it's present).

#### [MODIFY] [MainActivity.kt](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/android/app/src/main/kotlin/com/example/laza_shop_firebase_app/MainActivity.kt)
- Change standard `FlutterActivity` to `FlutterFragmentActivity` required for Android `local_auth`.

---

### Home Screen & Navigation

Integrate the entry point on the existing `HomeScreen`.

#### [MODIFY] [home_screen.dart](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/lib/screens/home_screen.dart)
- Update the `person` IconButton in the `AppBar`.
- Instead of immediately routing to `UserDataFormScreen`, it will invoke `BiometricAuthService.authenticate()`.
- On successful biometric auth, push `ProfileScreen`.

---

### Services

Encapsulate the device-specific logic into clean, reusable services.

#### [NEW] [biometric_auth_service.dart](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/lib/services/biometric_auth_service.dart)
- Expose an `authenticate()` method using `local_auth` that checks for device capabilities and prompts the user.

#### [NEW] [device_info_service.dart](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/lib/services/device_info_service.dart)
- Wrap `device_info_plus` to return OS Version and Device Model neatly.

#### [NEW] [audio_recording_service.dart](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/lib/services/audio_recording_service.dart)
- Handle the `record` package setup (checking mic permissions, writing to temp directory) and the `audioplayers` logic.

---

### Feature Screens

New separate Dart files for each feature and the central profile dashboard.

#### [NEW] [profile_screen.dart](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/lib/screens/profile_screen.dart)
- Show Profile Image (with `image_picker` to select a local placeholder), Name ("mahmoud khalaf" / Firebase user), and Email ("mody@gmail.com" / Firebase).
- Provide ListView tiles/buttons to navigate to: Device Info, Gallery, Google Map, and Audio.

#### [NEW] [device_info_screen.dart](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/lib/screens/device_info_screen.dart)
- Center layout showing Device Model and OS Version.

#### [NEW] [multi_image_screen.dart](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/lib/screens/multi_image_screen.dart)
- Contains a `ListView` displaying images.
- Contains a "Pick Image" button using `image_picker` multi-pick functionality.

#### [NEW] [google_map_screen.dart](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/lib/screens/google_map_screen.dart)
- Standard `google_maps_flutter` implementation centered on Cairo (30.0444, 31.2357) with a red marker.

#### [NEW] [audio_feature_screen.dart](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/lib/screens/audio_feature_screen.dart)
- UI handling states: Ready (Record Audio), Recording (Stop Recording), Done (Play Audio).

#### [MODIFY] [README.md](file:///F:/flutter_sprints/tasks/laza_shop_firebase_device_features_app/laza_shop_firebase_app/README.md)
- Include permissions, requirements, testing instructions, and how the Google Maps API is configured securely.

## Verification Plan

### Automated Checks
- `flutter analyze`
- `dart format .`
- `flutter build apk --debug`

### Manual Verification
- Test Biometric Authentication by tapping the profile icon.
- Test Device Info, Image Picker, Map (checking if the API key works), and Mic recording capabilities.