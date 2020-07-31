part of flutter_locker;

/// Data structure for saving the secret
class SaveSecretRequest {
  SaveSecretRequest(this.key, this.secret, this.androidPrompt);

  final String key;
  final String secret;
  final AndroidPrompt androidPrompt;

  /// Returns associated proto class
  protos.ProtoSaveRequest toProto() {
    return protos.ProtoSaveRequest()
      ..key = key
      ..secret = secret
      ..androidPrompt = androidPrompt.toProto();
  }
}
