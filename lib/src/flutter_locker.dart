part of flutter_locker;

/// Flutter plugin that secures your secrets in keychain using biometric authentication.
class FlutterLocker {
  FlutterLocker._();

  static const MethodChannel _channel = const MethodChannel('flutter_locker');

  static gen.PigeonApi _pigeonApi = gen.PigeonApi();

  /// Checks if the devices has biometric features
  static Future<bool?> canAuthenticate() {
    return _pigeonApi.canAuthenticate();
  }

  /// Saves the secret.
  ///
  /// On Android prompt is shown, while on iOS there is no need for the prompt when saving.
  static Future<void> save(SaveSecretRequest request) async {
    await _catchCommonError(() async {
      // await _channel.invokeMethod<void>(
      //   // protos.ProtoMethodInterface.saveSecret.value.toString(),
      //   // request.toProto().writeToBuffer(),
      // );

      await _pigeonApi.save(gen.SaveSecretRequest(
        key: request.key,
        androidPrompt: gen.AndroidPrompt(
          title: request.androidPrompt.title,
          description: request.androidPrompt.description,
          cancelLabel: request.androidPrompt.cancelLabel,
        ),
        secret: request.secret,
      ));

      return '';
    });
  }

  /// Retrieves the secret.
  ///
  /// You need to provide a prompt for Android and iOS. Prompt for iOS is used only with TouchID. FaceID uses strings for Info.plist.
  static Future<String> retrieve(RetrieveSecretRequest request) async {
    return await _catchCommonError(() async {
      // final String? secret = await _channel.invokeMethod();
      // protos.ProtoMethodInterface.retrieveSecret.value.toString(), request.toProto().writeToBuffer());
      // return secret ?? '';
      final _value = await _pigeonApi.retrieve(gen.RetrieveSecretRequest(
        key: request.key,
        androidPrompt: gen.AndroidPrompt(
          title: request.androidPrompt.title,
          description: request.androidPrompt.description,
          cancelLabel: request.androidPrompt.cancelLabel,
        ),
        iOsPrompt: gen.IOsPrompt(
          touchIdText: request.iOsPrompt.touchIdText,
        ),
      ));
      return _value;
    });
  }

  /// Deletes the key.
  static Future<void> delete(String key) async {
    // final request = protos.ProtoDeleteRequest()..key = key;
    // await _channel.invokeMethod<void>(ProtoMethodInterface.deleteSecret.value.toString(), request.writeToBuffer());
    await _pigeonApi.delete(key);
  }

  static Future<String> _catchCommonError(Future<String> Function() function) async {
    try {
      return await function();
    } on PlatformException catch (exception) {
      final lockerException = LockerException.fromCode(exception.code);
      if (lockerException != null) {
        throw lockerException;
      } else {
        rethrow;
      }
    }
  }
}
