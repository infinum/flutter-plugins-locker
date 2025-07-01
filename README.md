# Flutter Locker🔒

<p align="center">
    <img src="https://raw.githubusercontent.com/infinum/flutter-plugins-locker/master/Locker-github.jpg" width="700" max-width="50%" alt="Locker"/>
</p>

Flutter plugin that secures your secrets in keychain using biometric authentication (Fingerprint, Touch ID, Face ID...).


It uses:
 - [Locker on iOS](https://github.com/infinum/Locker)
 - [Goldfinger on Android](https://github.com/infinum/Android-Goldfinger)

## Table of contents

* [Usage](#usage)
* [Exceptions](#exceptions)
* [Notes](#notes)
* [Setup](#setup)
* [Contributing](#contributing)
* [License](#license)
* [Credits](#credits)

## Migrate to 2.1.0

The models now accept named parameters instead of unnamed, e.g.:

```dart
RetrieveSecretRequest(
  key: 'key',
  androidPrompt: AndroidPrompt(title: 'title', cancelLabel: 'cancel'),
  iOsPrompt: IOsPrompt(touchIdText: 'description'),
)
```

## Usage

```dart
FlutterLocker.supportsBiometricAuthentication();
```
Checks if the devices has biometric capabilities no matter if they are configured and turned on.

```dart
FlutterLocker.canAuthenticate();
```
Checks if the devices has biometric capabilities that are configured and turned on.

```dart
await FlutterLocker.save(SaveSecretRequest(
  key: 'key',
  secret: 'secret',
  androidPrompt: AndroidPrompt(title: 'Authenticate', cancelLabel: 'Cancel'),
));
```
Saves the secret. On Android prompt is shown, while on iOS there is no need for the prompt when saving.

```dart
await FlutterLocker.retrieve(RetrieveSecretRequest(
  key: key,
  androidPrompt: AndroidPrompt(title: 'Authenticate', cancelLabel: 'Cancel'),
  iOsPrompt: IOsPrompt(touchIdText: 'Authenticate'),
));
```
Retrieves the secret. You need to provide a prompt for Android and iOS. Prompt for iOS is used only with TouchID. FaceID uses strings from `Info.plist`.

```dart
await FlutterLocker.delete('key');
```
Deletes the secret.

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

## Contributing

We believe that the community can help us improve and build better a product.
Please refer to our [contributing guide](CONTRIBUTING.md) to learn about the types of contributions we accept and the process for submitting them.

To ensure that our community remains respectful and professional, we defined a [code of conduct](CODE_OF_CONDUCT.md) <!-- and [coding standards](<link>) --> that we expect all contributors to follow.

We appreciate your interest and look forward to your contributions.

## License

```text
Copyright 2024 Infinum

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

## Credits

Maintained and sponsored by [Infinum](https://infinum.com).

<div align="center">
    <a href='https://infinum.com'>
    <picture>
        <source srcset="https://assets.infinum.com/brand/logo/static/white.svg" media="(prefers-color-scheme: dark)">
        <img src="https://assets.infinum.com/brand/logo/static/default.svg">
    </picture>
    </a>
</div>
