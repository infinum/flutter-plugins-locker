## 2.2.0

- Added a `supportsBiometricAuthentication` method to check if the device has any biometric authentication capabilities.

- Fixed a potential race condition on iOS where the `save` method returned a result before the save callback was invoked, which could cause a missing key error when reading immediately after saving

## 2.1.6

- Swift Package Manager support

## 2.1.5

- Update dependencies
- Android improvements

## 2.1.4

- Update dependencies

## 2.1.3

- Fixed LockerException not showing exception details

## 2.1.2

- Fixed incorrect LockerException being return

## 2.1.1

- Migrate android dependencies to mavenCentral from jcenter
- Update dependencies

## 2.1.0+1

- Remove pigeon as dependency
- Decrease flutter version

## 2.1.0

- BREAKING: Models now accept named parameters instead of unnamed ones. Migration guide is in README

## 2.0.4

- Support building for Android on Apple M1 Macs
- Updated iOS Locker Pod

## 2.0.3

- Exposing `LockerException`
- Updated documentation and example

## 2.0.2

- Fix missing file

## 2.0.1

- Updated with iOS Locker 3.0

## 2.0.0

- Added null safety

## 1.0.2

- Updated documentation.

## 1.0.1

- Resolved maintenance issues

## 1.0.0

- Initial release
