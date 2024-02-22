part of '../flutter_locker.dart';

/// Common exception that Locker recognizes on both platforms.
///
/// Locker will throw PlatformException for all different kind of platform specific issues.
class LockerException implements Exception {
  LockerException({required this.reason});

  final LockerExceptionReason reason;

  static LockerException? fromCode(String? code) {
    switch (code) {
      case "secretNotFound":
        return LockerException(reason: LockerExceptionReason.secretNotFound);
      case "authenticationCanceled":
        return LockerException(
            reason: LockerExceptionReason.authenticationCanceled);
      case "authenticationFailed":
        return LockerException(
            reason: LockerExceptionReason.authenticationFailed);
      default:
        return null;
    }
  }

  @override
  String toString() {
    return 'LockerException: ${_reasonToMessage()}';
  }

  /// Returns message for developer
  String _reasonToMessage() {
    switch (reason) {
      case LockerExceptionReason.secretNotFound:
        return 'Secret not found for key.';
      case LockerExceptionReason.authenticationCanceled:
        return 'Authentication canceled by user.';
      case LockerExceptionReason.authenticationFailed:
        return 'User failed to authenticate.';
    }
  }
}

/// Common exceptions that are currently handled
enum LockerExceptionReason {
  // Happens when you try to retrieve a secret that was never saved for that key
  secretNotFound,
  // User canceled the authentication prompt
  authenticationCanceled,
  // User failed authentication, e.g. by too many wrong attempts
  authenticationFailed,
}
