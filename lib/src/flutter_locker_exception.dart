import 'package:flutter/material.dart';
import 'package:flutter_locker/gen/protos/flutter_locker.pb.dart';

class LockerException implements Exception {
  LockerException({@required this.reason}) : assert(reason != null);

  final LockerExceptionReason reason;

  factory LockerException.fromCode(String code) {
    if (code == ProtoLockerError.secretNotFound.value.toString()) {
      return LockerException(reason: LockerExceptionReason.secretNotFound);
    } else if (code ==
        ProtoLockerError.authenticationCanceled.value.toString()) {
      return LockerException(
          reason: LockerExceptionReason.authenticationCanceled);
    } else if (code == ProtoLockerError.authenticationFailed.value.toString()) {
      return LockerException(
          reason: LockerExceptionReason.authenticationFailed);
    } else {
      return null;
    }
  }

  @override
  String toString() {
    return 'LockerException: ${_reasonToMessage()}';
  }

  String _reasonToMessage() {
    switch (reason) {
      case LockerExceptionReason.secretNotFound:
        return 'Secret not found for key.';
      case LockerExceptionReason.authenticationCanceled:
        return 'Authentication canceled by user.';
      case LockerExceptionReason.authenticationFailed:
        return 'User failed to authenticate.';
      default:
        return '';
    }
  }
}

enum LockerExceptionReason {
  // Happens when you try to retrieve a secret that was never saved for that key
  secretNotFound,
  // User canceled the authentication prompt
  authenticationCanceled,
  // User failed authentication, e.g. by too many wrong attempts
  authenticationFailed,
}
