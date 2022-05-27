part of flutter_locker;

/// Data structure for retrieving the saved secret
class RetrieveSecretRequest {
  RetrieveSecretRequest(this.key, this.androidPrompt, this.iOsPrompt);

  final String key;
  final AndroidPrompt androidPrompt;
  final IOsPrompt iOsPrompt;
}

/// Data structure for saving the saved secret
class SaveSecretRequest {
  SaveSecretRequest(this.key, this.secret, this.androidPrompt);

  final String key;
  final String secret;
  final AndroidPrompt androidPrompt;
}

/// Defines text that's displayed in native OS prompt for authentication
///
/// title and cancel are required.
class AndroidPrompt {
  AndroidPrompt(this.title, this.cancelLabel, {this.description});

  final String title;
  final String cancelLabel;
  final String? description;
}

enum LockerError {
  secretNotFound,
  authenticationCanceled,
  authenticationFailed,
  unknown,
}

/// The iOS native dialog is only shown when retrieving secret.
///
/// - For phones with Touch ID, the [touchIdText] is displayed in prompt.
/// - For phones with Face ID, the text is defined in plist file.
class IOsPrompt {
  IOsPrompt(this.touchIdText);

  final String touchIdText;
}

@HostApi()
abstract class FlutterLockerApi {
  @async
  bool canAuthenticate();

  @async
  bool save(SaveSecretRequest request);

  @async
  String retrieve(RetrieveSecretRequest request);

  @async
  void delete(String key);
}
