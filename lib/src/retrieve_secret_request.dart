part of flutter_locker;

/// Data structure for retrieving the saved secret
class RetrieveSecretRequest {
  RetrieveSecretRequest(this.key, this.androidPrompt, this.iOsPrompt);

  final String key;
  final AndroidPrompt androidPrompt;
  final IOsPrompt iOsPrompt;

  protos.ProtoRetrieveRequest toProto() {
    return protos.ProtoRetrieveRequest()
      ..key = key
      ..androidPrompt = androidPrompt.toProto()
      ..iOsPrompt = iOsPrompt.toProto();
  }
}
