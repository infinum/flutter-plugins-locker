# Flutter Locker🔒 

<p align="center">
    <img src="https://raw.githubusercontent.com/infinum/flutter-plugins-locker/master/Locker-github.jpg" width="700" max-width="50%" alt="Locker"/>
</p>

Flutter plugin that secures your secrets in keychain using biometric authentication (Fingerprint, Touch ID, Face ID...).


It uses:
 - Locker on iOS (https://github.com/infinum/Locker)
 - Goldfinger on Android (https://github.com/infinum/Android-Goldfinger)
 
## Usage


```dart
FlutterLocker.canAuthenticate()
```
Checks if the devices has biometric features

```dart
FlutterLocker.save(SaveSecretRequest(key, secret, AndroidPrompt("Authenticate", "Cancel")))
``` 
Saves the secret. On Android prompt is shown, while on iOS there is no need for the prompt when saving.

```dart
FlutterLocker.retrieve(RetrieveSecretRequest(key, AndroidPrompt('Authenticate', 'Cancel'), IOsPrompt('Authenticate')))
```
Retrieves the secret. You need to provide a prompt for Android and iOS. Prompt for iOS is used only with TouchID. FaceID uses strings from `Info.plist`.

```dart
FlutterLocker.delete(key)
```
Deletes the key.


## Exceptions

For common exceptions, a `LockerException` is thrown. 

Use `LockerException.reason` to find out what went wrong: 

- secretNotFound - Happens when you try to retrieve a secret that was never saved for that key
- authenticationCanceled - User canceled the authentication prompt
- authenticationFailed - User failed authentication, e.g. by too many wrong attempts

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

