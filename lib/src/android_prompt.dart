part of flutter_locker;

/// Defines text that's displayed in native OS prompt for authentication
///
/// title and cancel are required.
class AndroidPrompt {
  AndroidPrompt(this.title, this.cancelLabel, {this.description});

  final String title;
  final String cancelLabel;
  final String? description;

  /// Returns associated proto class
  protos.ProtoAndroidPrompt toProto() {
    var prompt = protos.ProtoAndroidPrompt()
      ..titleText = title
      ..cancelText = cancelLabel;

    if (description != null) {
      prompt.description = description!;
    }

    return prompt;
  }
}
