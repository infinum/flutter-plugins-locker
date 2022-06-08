part of flutter_locker;

/// Flutter plugin that secures your secrets in keychain using biometric authentication.
class FlutterLocker {
  FlutterLocker._();

  static PigeonApi _pigeonApi = PigeonApi();

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

      await _pigeonApi.save(request);

      return '';
    });
  }

  /// Retrieves the secret.
  ///
  /// You need to provide a prompt for Android and iOS. Prompt for iOS is used only with TouchID. FaceID uses strings for Info.plist.
  static Future<String> retrieve(RetrieveSecretRequest request) async {
    return await _catchCommonError(() async {
      final _value = await _pigeonApi.retrieve(request);
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
      final lockerException = LockerException.fromCode(exception.message);
      print('Locker exception: [${exception.message}] ${lockerException}');
      if (lockerException != null) {
        throw lockerException;
      } else {
        rethrow;
      }
    }
  }
}
