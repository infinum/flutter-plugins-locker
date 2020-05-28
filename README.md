# **flutter_locker🔒** 

Flutter plugin that secures your secrets in keychain using biometric authentication.


It uses:
 - Locker on iOS (https://github.com/infinum/Locker)
 - Goldfinger on Android (https://github.com/infinum/Android-Goldfinger)
 
### Methods


```dart
FlutterLocker.canAuthenticate()
```
Checks if the devices has biometric features




```dart
FlutterLocker.save(SaveSecretRequest(key, secret, AndroidPrompt("Authenticate", "Cancel")))
``` 
Saves the secret. On Android promt is shown, while on iOS there is no need for prompt when saving.

```dart
FlutterLocker.retrieve(RetrieveSecretRequest(key, AndroidPrompt('Authenticate', 'Cancel'), IOsPrompt('Authenticate')))
```
Retrieves the secret. You need to provide prompt for Android and iOS. Prompt for iOS is used only with TouchID. FaceID uses strings for Info.plist.

```dart
FlutterLocker.delete(key)
```
Deletes the key.


### Errors

There are some common exceptions you can intercept and handle. All of the exceptions are PlatformExceptions, and in `exception.code` you'll receive these values:
- 0 - Secret not found, happens when you try to retrieve secret without ever saving it.
- 1 - Authentication canceled, happens when user cancels the prompt.
- 2 - Authentication failed, happens when user fails multiple biometric checks
- 3 - Unknown or all other errors. There are many other more specific errors that can happen on any platform. If this happens you can read `exception.message` for more info.
 
 
### Notes
Note:
 - iOS only: app will not show authentication dialog when saving (authentication will always succeed)
 - iOS only: you can't override password with new one. You need the use `delete` first.
 - please follow **Locker's** and **Goldfinger's** setup to prevent any issues.

iOS:
 - in order to use **Locker**, you need to ask permission for __Face ID__ usage:
 - add following to your **Info.plist** from drop down menu
    - Privacy - Face ID usage description
    - after new field was added, provide meaningful description
 - failure to do so will result in following error
 ```
    This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSFaceIDUsageDescription key with a string value explaining to the user how the app uses this data.
```
