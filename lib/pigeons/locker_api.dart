import 'package:pigeon/pigeon.dart';

/// Command to generate all files:
/// flutter pub run pigeon --input lib/pigeons/locker_api.dart --dart_out lib/gen/locker_api.gen.dart --objc_header_out ios/Classes/flutter_locker.h --objc_source_out ios/Classes/flutter_locker.m --java_out ./android/src/main/java/com/example/flutter_locker/FlutterLocker.java --java_package “com.example.flutter_locker”

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
  AndroidPrompt(this.title, this.cancelLabel, {this.descriptionLabel});

  final String title;
  final String cancelLabel;
  final String? descriptionLabel;
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
abstract class PigeonApi {
  @async
  bool canAuthenticate();

  @async
  bool save(SaveSecretRequest request);

  @async
  String retrieve(RetrieveSecretRequest request);

  @async
  void delete(String key);
}
