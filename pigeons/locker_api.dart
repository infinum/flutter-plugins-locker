import 'package:pigeon/pigeon.dart';

/// Run pigeon:
/// dart run pigeon --input pigeons/locker_api.dart

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/gen/locker_api.gen.dart',
  swiftOut: 'ios/flutter_locker/Sources/flutter_locker/FlutterLocker.swift',
  kotlinOut: 'android/src/main/kotlin/com/infinum/flutter_locker/FlutterLocker.kt',
  kotlinOptions: KotlinOptions(
    package: 'com.infinum.flutter_locker',
  ),
))

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
abstract class FlutterLockerHostApi {
  @async
  bool supportsBiometricAuthentication();

  @async
  bool canAuthenticate();

  @async
  void save(SaveSecretRequest request);

  @async
  String retrieve(RetrieveSecretRequest request);

  @async
  void delete(String key);
}
