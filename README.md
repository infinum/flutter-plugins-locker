# Flutter Locker🔒 

<p align="center">
    <img src="https://raw.githubusercontent.com/infinum/flutter-plugins-locker/master/Locker-github.jpg" width="700" max-width="50%" alt="Locker"/>
</p>

Flutter plugin that secures your secrets in keychain using biometric authentication (Fingerprint, Touch ID, Face ID...).


It uses:
 - Locker on iOS (https://github.com/infinum/Locker)
 - Goldfinger on Android (https://github.com/infinum/Android-Goldfinger)

## Migrate to 2.1.0

The models now accept named parameters instead of unnamed, e.g.:

```dart
RetrieveSecretRequest(
   key: key,
   androidPrompt: AndroidPrompt(
      title: title,
      cancelLabel: cancel,
      descriptionLabel: description,
   ),
   iOsPrompt: IOsPrompt(touchIdText: description),
```
 
## Usage

To check if the devices has biometric features:

```dart
FlutterLocker.canAuthenticate()
```

To save the secret:
```dart
FlutterLocker.save(SaveSecretRequest(
   key: "key",
   secret: "secret",
   androidPrompt: AndroidPrompt(title: "Authenticate", cancelLabel: "Cancel"),
));
``` 
On Android a prompt is shown, while on iOS there is no need for the prompt when saving.

To retrieve the secret:
```dart
FlutterLocker.retrieve(RetrieveSecretRequest(
   key: "key",
   androidPrompt: AndroidPrompt(title: "Authenticate", cancelLabel: "Cancel"),
   iOsPrompt: IOsPrompt(touchIdText: "Authenticate"),
));
```
You need to provide a prompt for Android and iOS. The prompt for iOS is used only with TouchID, FaceID uses strings from `Info.plist`.

To delete the key:
```dart
FlutterLocker.delete(key);
```

## Exceptions

For common exceptions, a `LockerException` is thrown. 

Use `LockerException.reason` to find out what went wrong: 

- `secretNotFound` - Happens when you try to retrieve a secret that was never saved for that key
- `authenticationCanceled` - User canceled the authentication prompt
- `authenticationFailed` - User failed authentication, e.g. by too many wrong attempts

For other exception, a `PlatformException` is thrown. You can use `PlatformException.message` to get more info.
 
## Notes

- iOS only: app will not show authentication dialog when saving (authentication will always succeed)
- please follow [Locker](https://github.com/infinum/Locker) and [Goldfinger](https://github.com/infinum/Android-Goldfinger) setup to prevent any issues

## Setup

### iOS

To use **Locker** you need to add the `NSFaceIDUsageDescription` to you `Info.plist`.

If `NSFaceIDUsageDescription` is not provided, the app will crash with the following error:
```
This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSFaceIDUsageDescription key with a string value explaining to the user how the app uses this data.
```

### Android

Ensure `MainActivity` extends `FlutterFragmentActivity`.

```kotlin
class MainActivity: FlutterFragmentActivity() {
    // ...
}
```

When showing authentication prompt, the app might crash on some Samsung devices if you don't use an appropriate theme: https://github.com/infinum/flutter-plugins-locker/commit/fcb1f6401d89f860d24ea9a75027d62a03e87926.

<p align="center">
  <a href='https://infinum.com'>
    <picture>
        <source srcset="https://assets.infinum.com/brand/logo/static/white.svg" media="(prefers-color-scheme: dark)">
        <img src="https://assets.infinum.com/brand/logo/static/default.svg">
    </picture>
  </a>
</p>

### Updating pigeon files

Pigeon generation:
```bash
flutter pub run pigeon --input pigeons/locker_api.dart --dart_out lib/gen/locker_api.gen.dart --objc_header_out ios/Classes/flutter_locker.h --objc_source_out ios/Classes/flutter_locker.m --java_out ./android/src/main/java/com/example/flutter_locker/FlutterLocker.java --java_package "com.example.flutter_locker"
```
