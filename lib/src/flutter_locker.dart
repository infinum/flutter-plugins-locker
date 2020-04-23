part of flutter_locker;

class FlutterLocker {
  /// Singleton
  FlutterLocker._();

  static const MethodChannel _channel = const MethodChannel('flutter_locker');

  static Future<bool> canAuthenticate() async {
    final bool success = await _channel.invokeMethod(protos.ProtoMethodInterface.canAuthenticate.value.toString());
    return success;
  }

  static Future<void> save(SaveSecretRequest request) async {
    await _channel.invokeMethod(
      protos.ProtoMethodInterface.saveSecret.value.toString(),
      request.toProto().writeToBuffer(),
    );
  }

  static Future<String> retrieve(RetrieveSecretRequest request) async {
    final String secret = await _channel.invokeMethod(
        protos.ProtoMethodInterface.retrieveSecret.value.toString(), request.toProto().writeToBuffer());
    return secret;
  }

  static Future<void> delete(String key) async {
    final request = protos.ProtoDeleteRequest()..key = key;
    await _channel.invokeMethod(ProtoMethodInterface.deleteSecret.value.toString(), request.writeToBuffer());
  }
}
