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
