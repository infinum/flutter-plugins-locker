# flutter_locker

Flutter plugin that secures your secret with biometric authentication.

It uses:
 - Locker on iOS (https://github.com/infinum/Locker)
 - Goldfinger on Android (https://github.com/infinum/Android-Goldfinger)
 
### Methods

- `FlutterLocker.canAuthenticate()`
- `FlutterLocker.save(key, secret, androidPromptTitle, androidCancelTitle)`
As you when saving on Android, OS will show prompt and you also need to pass prompt title and cancel.
- `FlutterLocker.retrieve(key, title, androidCancelTitle`)
This title is used in both iOS and Android prompt.
 
 
Note:
 - iOS simulator will not show authentication dialog (authentication will always succeed)
 - (when encrypting iOS doesn't show dialog?)
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