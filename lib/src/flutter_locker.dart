part of flutter_locker;

/// Flutter plugin that secures your secrets in keychain using biometric authentication.
class FlutterLocker {
  /// Singleton
  FlutterLocker._();

  static const MethodChannel _channel = const MethodChannel('flutter_locker');

  /// Checks if the devices has biometric features
  static Future<bool?> canAuthenticate() async {
    final bool? success = await _channel.invokeMethod(
        protos.ProtoMethodInterface.canAuthenticate.value.toString());
    return success;
  }

  /// Saves the secret.
  ///
  /// On Android prompt is shown, while on iOS there is no need for the prompt when saving.
  static Future<void> save(SaveSecretRequest request) async {
    await _catchCommonError(() async {
      await _channel.invokeMethod(
        protos.ProtoMethodInterface.saveSecret.value.toString(),
        request.toProto().writeToBuffer(),
      );
    });
  }

  /// Retrieves the secret.
  ///
  /// You need to provide a prompt for Android and iOS. Prompt for iOS is used only with TouchID. FaceID uses strings for Info.plist.
  static Future<String> retrieve(RetrieveSecretRequest request) async {
    return await _catchCommonError(() async {
      final String? secret = await _channel.invokeMethod(
          protos.ProtoMethodInterface.retrieveSecret.value.toString(),
          request.toProto().writeToBuffer());
      return secret;
    });
  }

  /// Deletes the key.
  static Future<void> delete(String key) async {
    final request = protos.ProtoDeleteRequest()..key = key;
    await _channel.invokeMethod(
        ProtoMethodInterface.deleteSecret.value.toString(),
        request.writeToBuffer());
  }

  static _catchCommonError(Function function) async {
    try {
      return await function();
    } catch (on, _) {
      // try to intercept common exceptions
      if (on is! PlatformException) {
        rethrow;
      }

      final lockerException = LockerException.fromCode(on.code);
      if (lockerException != null) {
        throw lockerException;
      } else {
        rethrow;
      }
    }
  }
}
