part of flutter_locker;

/// The iOS native dialog is only shown when retrieveing secret.
///
/// - For phones with Touch ID, the [touchIdText] is displayed in prompt.
/// - For phones with Face ID, the text is defined in plist file.
class IOsPrompt {
  IOsPrompt(this.touchIdText);

  final String touchIdText;

  protos.ProtoIOsPrompt toProto() {
    return protos.ProtoIOsPrompt()..touchIdText = touchIdText;
  }
}
